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

//struct VLCPlayerView: UIViewRepresentable{
//    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<VLCPlayerView>) {
//    }
//
//    func makeUIView(context: Context) -> UIView {
//        return PlayerUIView(frame: .zero)
//    }
//}
//
//class PlayerUIView: UIView, VLCMediaPlayerDelegate {
//  private let mediaPlayer = VLCMediaPlayer()
//    @State var urlString:String = ""
//
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//
//      if urlString.isEmpty{
//          return;
//      }
//    let url = URL(string: urlString)!
//
//    mediaPlayer.media = VLCMedia(url: url)
//    mediaPlayer.delegate = self
//    mediaPlayer.drawable = self
//    mediaPlayer.play()
//  }
//
//  required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  override func layoutSubviews() {
//    super.layoutSubviews()
//  }
//}
//
//struct VLCPlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        VLCPlayerView()
//    }
//}

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
    @State var mediaURL: String? //update this
    var body: some View {
      VLCPlayerView(mediaUrl: $mediaURL)
   }
}

