//
//  StreamView.swift
//  RTSPPlayer
//
//  Created by bi119aTe5hXk on 2025/03/13.
//

import SwiftUI


struct StreamView: View {
	@State var urlArr:Array<String?>

	var body: some View {
		HStack(spacing: 0){
			if urlArr.count == 1 {
				VLCPlayerView(mediaUrl: $urlArr[0])
					.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
			}else if urlArr.count <= 4 {
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
			}else if urlArr.count <= 9 {
				VStack(spacing: 0){
					if urlArr.count >= 1{
						VLCPlayerView(mediaUrl: $urlArr[0])
					}
					if urlArr.count >= 2{
						VLCPlayerView(mediaUrl: $urlArr[1])
					}
					if urlArr.count >= 3{
						VLCPlayerView(mediaUrl: $urlArr[2])
					}
				}
				VStack(spacing: 0){
					if urlArr.count >= 4{
						VLCPlayerView(mediaUrl: $urlArr[3])
					}
					if urlArr.count >= 5{
						VLCPlayerView(mediaUrl: $urlArr[4])
					}
					if urlArr.count >= 6{
						VLCPlayerView(mediaUrl: $urlArr[5])
					}
				}
				VStack(spacing: 0){
					if urlArr.count >= 7{
						VLCPlayerView(mediaUrl: $urlArr[6])
					}
					if urlArr.count >= 8{
						VLCPlayerView(mediaUrl: $urlArr[7])
					}
					if urlArr.count >= 9{
						VLCPlayerView(mediaUrl: $urlArr[8])
					}
				}
			}else{
				VStack(spacing: 0){
					if urlArr.count >= 1{
						VLCPlayerView(mediaUrl: $urlArr[0])
					}
					if urlArr.count >= 2{
						VLCPlayerView(mediaUrl: $urlArr[1])
					}
					if urlArr.count >= 3{
						VLCPlayerView(mediaUrl: $urlArr[2])
					}
					if urlArr.count >= 4{
						VLCPlayerView(mediaUrl: $urlArr[3])
					}
				}
				VStack(spacing: 0){
					if urlArr.count >= 5{
						VLCPlayerView(mediaUrl: $urlArr[4])
					}
					if urlArr.count >= 6{
						VLCPlayerView(mediaUrl: $urlArr[5])
					}
					if urlArr.count >= 7{
						VLCPlayerView(mediaUrl: $urlArr[6])
					}
					if urlArr.count >= 8{
						VLCPlayerView(mediaUrl: $urlArr[7])
					}
				}
				VStack(spacing: 0){
					if urlArr.count >= 9{
						VLCPlayerView(mediaUrl: $urlArr[8])
					}
					if urlArr.count >= 10{
						VLCPlayerView(mediaUrl: $urlArr[9])
					}
					if urlArr.count >= 11{
						VLCPlayerView(mediaUrl: $urlArr[10])
					}
					if urlArr.count >= 12{
						VLCPlayerView(mediaUrl: $urlArr[11])
					}
				}
				VStack(spacing: 0){
					if urlArr.count >= 13{
						VLCPlayerView(mediaUrl: $urlArr[12])
					}
					if urlArr.count >= 14{
						VLCPlayerView(mediaUrl: $urlArr[13])
					}
					if urlArr.count >= 15{
						VLCPlayerView(mediaUrl: $urlArr[14])
					}
					if urlArr.count >= 16{
						VLCPlayerView(mediaUrl: $urlArr[15])
					}
				}
			}

		}.padding(0)
            .edgesIgnoringSafeArea(.all)


	}
}

struct StreamView_Previews: PreviewProvider {
	static var previews: some View {
		StreamView(urlArr: [""])
	}
}
