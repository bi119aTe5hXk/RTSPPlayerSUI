//
//  Stream4View.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import SwiftUI

struct Stream4View: View {
    @State var urlArr:Array<String?>
    
    var body: some View {
        HStack(spacing: 0){
            VStack(spacing: 0){
                if urlArr.count >= 1{
                    VLCPlayerView(mediaUrl: $urlArr[0])
                }
                if urlArr.count >= 2{
                    VLCPlayerView(mediaUrl: $urlArr[1])
                }
            }
            VStack(spacing: 0){
                if urlArr.count >= 3{
                    VLCPlayerView(mediaUrl: $urlArr[2])
                }
                if urlArr.count >= 4{
                    VLCPlayerView(mediaUrl: $urlArr[3])
                }
            }
        }.padding(0)
            .edgesIgnoringSafeArea(.all)
        
        
    }
}

struct Stream4View_Previews: PreviewProvider {
    static var previews: some View {
        let arr = Array(repeating: "about:blank", count: 4)
        Stream16View(urlArr: arr)
    }
}
