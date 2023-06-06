//
//  Steam1View.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import SwiftUI


struct Stream1View: View {
    @State var urlArr:Array<String?>
    
    var body: some View {
        
        VLCPlayerView(mediaUrl: $urlArr[0])
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Stream1View_Previews: PreviewProvider {
    static var previews: some View {
        Stream1View(urlArr: [""])
    }
}
