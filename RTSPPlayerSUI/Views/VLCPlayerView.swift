//
//  VLCPlayerView.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import Foundation
import SwiftUI
import VLCKitSPM

import SwiftUI
#if os(iOS) || os(tvOS)
struct VLCPlayerView: UIViewRepresentable {
    @Binding var mediaUrl: String?

    class Coordinator {
        var mediaPlayer: VLCMediaPlayer?
        var reconnectTimer: DispatchSourceTimer?
        deinit {
            mediaPlayer?.stop()
            mediaPlayer = nil
            reconnectTimer?.cancel()
            reconnectTimer = nil
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> UIView {
        let uiView = UIView()
        let player = VLCMediaPlayer()
        context.coordinator.mediaPlayer = player
        DispatchQueue.main.async {
            player.drawable = uiView
        }
        if let urlStr = mediaUrl {
            DispatchQueue.main.async {
                startPlayer(
                    url: urlStr,
                    player: player,
                    timer: context.coordinator.reconnectTimer
                )
            }
        }
        return uiView
    }

    func updateUIView(_ uiView: UIView, context: Context) {}

    static func dismantleUIView(_ uiView: UIView, coordinator: Coordinator) {
        coordinator.mediaPlayer?.stop()
        coordinator.mediaPlayer = nil
        coordinator.reconnectTimer?.cancel()
        coordinator.reconnectTimer = nil
    }
}
#endif

#if os(macOS)
struct VLCPlayerView: NSViewRepresentable {
    @Binding var mediaUrl: String?

    class Coordinator {
        var mediaPlayer: VLCMediaPlayer?
        var reconnectTimer: DispatchSourceTimer?
        deinit {
            mediaPlayer?.stop()
            mediaPlayer = nil
            reconnectTimer?.cancel()
            reconnectTimer = nil
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeNSView(context: Context) -> NSView {
        let nsView = NSView()
        let player = VLCMediaPlayer()
        context.coordinator.mediaPlayer = player
        DispatchQueue.main.async {
            player.drawable = nsView
        }
        if let urlStr = mediaUrl {
            DispatchQueue.main.async {
                startPlayer(
                    url: urlStr,
                    player: player,
                    timer: context.coordinator.reconnectTimer
                )
            }
        }
        return nsView
    }

    func updateNSView(_ nsView: NSView, context: Context) {}
    static func dismantleUIView(_ view: NSView, coordinator: Coordinator) {
        coordinator.mediaPlayer?.stop()
        coordinator.mediaPlayer = nil
        coordinator.reconnectTimer?.cancel()
        coordinator.reconnectTimer = nil
    }
}

#endif

func startPlayer(url:String?, player:VLCMediaPlayer, timer:DispatchSourceTimer?){
    if let urlStr = url{
        if player.isPlaying{
            print("stop player")
            player.stop()
        }
        player.media = VLCMedia(url: URL(string: urlStr)!)
        player.media?.addOption(":no-audio")
		let opts = [
//			":rtsp-tcp":                "",
			":network-caching":         "300",
			":live-caching":            "300",
			":no-drop-late-frames":     "",
			":no-skip-frames":          "",
			":avcodec-hw":               "videotoolbox",
			":codec":                    "h264"
		]
		player.media?.addOptions(opts)

#if !os(macOS)
			UIApplication.shared.isIdleTimerDisabled = true
#endif
        player.play()
        if var timer1 = timer{
            timer1 = makeReconnectTimer(for: player,
                                        interval: 5.0)
            timer1.activate()
        }
        
    }else{
        print("url is empty")
        player.stop()
    }
}

func makeReconnectTimer(for player: VLCMediaPlayer,
						interval: TimeInterval = 5.0) -> DispatchSourceTimer {
	let timer = DispatchSource.makeTimerSource(queue: DispatchQueue.global(qos: .background))
	timer.schedule(deadline: .now() + interval, repeating: interval)
	timer.setEventHandler { [weak player] in
		guard let p = player else { return }
		if !p.isPlaying || p.state != .playing {
			DispatchQueue.main.async {
				p.play()
			}
		}
	}
	timer.resume()
	return timer
}

//struct ContentView: View {
//    @State var mediaURL: String?
//    var body: some View {
//      VLCPlayerView(mediaUrl: $mediaURL)
//   }
//}
