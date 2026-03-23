//
//  PlayerView.swift
//  RTSPPlayer
//
//  Created by bi119aTe5hXk on 2025/07/31.
//

import SwiftUI


public struct PlayerView: View {
	@Binding var mediaUrl: String?

	let usingVLC = true

	var originalSize: CGSize = .init(width: 1920, height: 1080)

	public var body: some View {
		if usingVLC {
			VLCPlayerView(mediaUrl: $mediaUrl)
				.background(Color.black)
                .onDisappear {
                    
                }
        }else{
            
        }

	}
}
