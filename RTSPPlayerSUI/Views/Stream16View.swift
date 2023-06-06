//
//  Stream16View.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import SwiftUI

struct Stream16View: View {
    @State var urlArr:Array<String?>
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[0])
                VLCPlayerView(mediaUrl: $urlArr[1])
                VLCPlayerView(mediaUrl: $urlArr[2])
                VLCPlayerView(mediaUrl: $urlArr[3])
            }
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[4])
                VLCPlayerView(mediaUrl: $urlArr[5])
                VLCPlayerView(mediaUrl: $urlArr[6])
                VLCPlayerView(mediaUrl: $urlArr[7])
            }
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[8])
                VLCPlayerView(mediaUrl: $urlArr[9])
                VLCPlayerView(mediaUrl: $urlArr[10])
                VLCPlayerView(mediaUrl: $urlArr[11])
            }
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[12])
                VLCPlayerView(mediaUrl: $urlArr[13])
                VLCPlayerView(mediaUrl: $urlArr[14])
                VLCPlayerView(mediaUrl: $urlArr[15])
            }
        }.padding(0)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Stream16View_Previews: PreviewProvider {
    static var previews: some View {
        let arr = Array(repeating: "about:blank", count: 16)
        Stream16View(urlArr: arr)
    }
}
