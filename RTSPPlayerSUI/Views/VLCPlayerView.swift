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

    @State var mediaPlayer = VLCMediaPlayer()

    typealias UIViewType = UIView

    func makeUIView(context: Context) -> UIView {
        let uiView = UIView()
        mediaPlayer.drawable = uiView
        return uiView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        startPlayer(url: mediaUrl, player: mediaPlayer)
    }
}
#endif

#if os(macOS)
struct VLCPlayerView: NSViewRepresentable {
    @Binding var mediaUrl: String?

    @State var mediaPlayer = VLCMediaPlayer()

    typealias NSViewType = NSView
    func makeNSView(context: Context) -> NSView {
        let uiView = NSView()
        mediaPlayer.drawable = uiView
        return uiView
    }
    
    func updateNSView(_ nsView: NSView, context: Context) {
        startPlayer(url: mediaUrl, player: mediaPlayer)
    }
}
#endif

func startPlayer(url:String?, player:VLCMediaPlayer){
    if let urlStr = url{
        if player.isPlaying{
            print("stop player")
            player.stop()
        }
        player.media = VLCMedia(url: URL(string: urlStr)!)
        player.media?.addOption(":no-audio")
        player.play()
    }else{
        print("url is empty")
        player.stop()
    }
}

struct ContentView: View {
    @State var mediaURL: String?
    var body: some View {
      VLCPlayerView(mediaUrl: $mediaURL)
   }
}
