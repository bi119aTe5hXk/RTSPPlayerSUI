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

struct VLCPlayerView: UIViewRepresentable {

    @Binding var mediaUrl: String?

    @State var mediaPlayer = VLCMediaPlayer()

    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let uiView = UIView()
        mediaPlayer.drawable = uiView
        return uiView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        if let urlstr = mediaUrl {
            let url = URL(string: urlstr)
            mediaPlayer.media = VLCMedia(url: url!)
            mediaPlayer.play()
        } else {
            mediaPlayer.stop()
        }
    }
}

struct ContentView: View {
    @State var mediaURL: String? 
    var body: some View {
      VLCPlayerView(mediaUrl: $mediaURL)
   }
}

