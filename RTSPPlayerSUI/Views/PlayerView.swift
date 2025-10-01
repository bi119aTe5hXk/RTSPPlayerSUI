//
//  PlayerView.swift
//  RTSPPlayer
//
//  Created by bi119aTe5hXk on 2025/07/31.
//

import SwiftUI
import MPVKit

public struct PlayerView: View {
	@Binding var mediaUrl: String?

	let usingVLC = true

	var originalSize: CGSize = .init(width: 1920, height: 1080)

	public var body: some View {
		if usingVLC {
			VLCPlayerView(mediaUrl: $mediaUrl)
				.background(Color.black)
		} else {
			if let urlstr = mediaUrl{

				GeometryReader { proxy in
					let containerSize = proxy.size
					let scale = min(
						containerSize.width  / originalSize.width,
						containerSize.height / originalSize.height
					)



				MPVVideoPlayer(url: URL(string: urlstr)!)
						.frame(width: originalSize.width,
							   height: originalSize.height)
						.scaleEffect(scale, anchor: .center)
						.position(x: containerSize.width/2,
								  y: containerSize.height/2)
				}
				.background(Color.black)


			}
		}
	}
}
