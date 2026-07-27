//
//  VLCPlayerView.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import Foundation
import SwiftUI
import VLCKitSPM

final class VLCPlayerCoordinator: NSObject, VLCMediaPlayerDelegate {
	private let watchdogInterval: TimeInterval = 2
	private let stalledInterval: TimeInterval = 8
	private let startupInterval: TimeInterval = 12

	private(set) var mediaPlayer: VLCMediaPlayer?
	private var mediaURL: URL?
	private var watchdog: DispatchSourceTimer?
	private var pendingRestart: DispatchWorkItem?
	private var lastProgressAt = Date()
	private var startedAt = Date()
	private var restartAttempt = 0
	private var isStopped = false

	func attach(to drawable: AnyObject, urlString: String?) {
		assert(Thread.isMainThread)

		let player = VLCMediaPlayer()
		player.delegate = self
		player.drawable = drawable
		mediaPlayer = player

		startWatchdog()
		updateURL(urlString)
	}

	func updateURL(_ urlString: String?) {
		assert(Thread.isMainThread)

		let newURL = urlString.flatMap(URL.init(string:))
		guard newURL != mediaURL else { return }

		pendingRestart?.cancel()
		pendingRestart = nil
		restartAttempt = 0
		mediaURL = newURL

		guard newURL != nil else {
			mediaPlayer?.stop()
			return
		}

		startPlayback()
	}

	func stop() {
		assert(Thread.isMainThread)

		isStopped = true
		pendingRestart?.cancel()
		pendingRestart = nil
		watchdog?.cancel()
		watchdog = nil

		mediaPlayer?.delegate = nil
		mediaPlayer?.stop()
		mediaPlayer = nil
	}

	func mediaPlayerTimeChanged(_ notification: Notification) {
		DispatchQueue.main.async { [weak self] in
			guard let self, !self.isStopped else { return }

			self.lastProgressAt = Date()
			self.restartAttempt = 0
			self.pendingRestart?.cancel()
			self.pendingRestart = nil
		}
	}

	func mediaPlayerStateChanged(_ notification: Notification) {
		DispatchQueue.main.async { [weak self] in
			guard let self, let player = self.mediaPlayer, !self.isStopped else {
				return
			}

			switch player.state {
			case .error, .ended:
				self.scheduleRestart()
			default:
				break
			}
		}
	}

	private func makeMedia(url: URL) -> VLCMedia {
		let media = VLCMedia(url: url)
		media.addOption(":no-audio")
		media.addOption(":rtsp-tcp")
		media.addOption(":network-caching=500")
		media.addOption(":live-caching=500")
		media.addOption(":avcodec-hw=videotoolbox")
		return media
	}

	private func startPlayback() {
		assert(Thread.isMainThread)

		guard let player = mediaPlayer, let url = mediaURL, !isStopped else {
			return
		}

		pendingRestart?.cancel()
		pendingRestart = nil

		player.stop()
		player.media = makeMedia(url: url)

		let now = Date()
		startedAt = now
		lastProgressAt = now
		player.play()
	}

	private func startWatchdog() {
		let timer = DispatchSource.makeTimerSource(queue: .main)
		timer.schedule(
			deadline: .now() + watchdogInterval,
			repeating: watchdogInterval
		)
		timer.setEventHandler { [weak self] in
			self?.checkPlayback()
		}
		watchdog = timer
		timer.activate()
	}

	private func checkPlayback() {
		assert(Thread.isMainThread)

		guard let player = mediaPlayer, mediaURL != nil, !isStopped else {
			return
		}

		let now = Date()
		let hasStarted = now.timeIntervalSince(startedAt) >= startupInterval
		let hasStalled = now.timeIntervalSince(lastProgressAt) >= stalledInterval

		switch player.state {
		case .error, .ended, .stopped:
			scheduleRestart()
		case .playing:
			if hasStalled {
				scheduleRestart()
			}
		case .opening, .buffering:
			if hasStarted {
				scheduleRestart()
			}
		default:
			break
		}
	}

	private func scheduleRestart() {
		assert(Thread.isMainThread)

		guard pendingRestart == nil, mediaURL != nil, !isStopped else {
			return
		}

		let exponentialDelay = min(pow(2, Double(restartAttempt)), 15)
		let jitter = Double.random(in: 0...0.5)
		let delay = exponentialDelay + jitter
		restartAttempt += 1

		let workItem = DispatchWorkItem { [weak self] in
			guard let self else { return }
			self.pendingRestart = nil
			self.startPlayback()
		}
		pendingRestart = workItem
		DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: workItem)
	}

	deinit {
		pendingRestart?.cancel()
		watchdog?.cancel()
	}
}

#if os(iOS) || os(tvOS)
struct VLCPlayerView: UIViewRepresentable {
	@Binding var mediaUrl: String?

	func makeCoordinator() -> VLCPlayerCoordinator {
		VLCPlayerCoordinator()
	}

	func makeUIView(context: Context) -> UIView {
		let view = UIView()
		context.coordinator.attach(to: view, urlString: mediaUrl)
		return view
	}

	func updateUIView(_ uiView: UIView, context: Context) {
		context.coordinator.updateURL(mediaUrl)
	}

	static func dismantleUIView(
		_ uiView: UIView,
		coordinator: VLCPlayerCoordinator
	) {
		coordinator.stop()
	}
}
#endif

#if os(macOS)
struct VLCPlayerView: NSViewRepresentable {
	@Binding var mediaUrl: String?

	func makeCoordinator() -> VLCPlayerCoordinator {
		VLCPlayerCoordinator()
	}

	func makeNSView(context: Context) -> NSView {
		let view = NSView()
		context.coordinator.attach(to: view, urlString: mediaUrl)
		return view
	}

	func updateNSView(_ nsView: NSView, context: Context) {
		context.coordinator.updateURL(mediaUrl)
	}

	static func dismantleNSView(
		_ nsView: NSView,
		coordinator: VLCPlayerCoordinator
	) {
		coordinator.stop()
	}
}
#endif
