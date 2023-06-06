//
//  Stream9View.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import SwiftUI

struct Stream9View: View {
    @State var urlArr:Array<String?>
    
    var body: some View {
        
        HStack(spacing: 0){
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[0])
                VLCPlayerView(mediaUrl: $urlArr[1])
                VLCPlayerView(mediaUrl: $urlArr[2])
            }
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[3])
                VLCPlayerView(mediaUrl: $urlArr[4])
                VLCPlayerView(mediaUrl: $urlArr[5])
            }
            VStack(spacing: 0){
                VLCPlayerView(mediaUrl: $urlArr[6])
                VLCPlayerView(mediaUrl: $urlArr[7])
                VLCPlayerView(mediaUrl: $urlArr[8])
            }
        }.padding(0)
            .edgesIgnoringSafeArea(.all)
        
    }
}

struct Stream9View_Previews: PreviewProvider {
    static var previews: some View {
        let arr = Array(repeating: "about:blank", count: 9)
        Stream16View(urlArr: arr)
    }
}
