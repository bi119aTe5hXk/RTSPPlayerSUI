//
//  URLListView.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/05.
//

import SwiftUI

struct URLListView: View {
    var userDef: UD
    @State var urlArr: [String]
    @State private var selectedFeed = ""
    @State private var emptyAlert = false

    @State private var presentSteamView = false

    init() {
        userDef = UD()
        urlArr = userDef.readURLArray()
        // print(urlArr)
    }

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    // add feed button
                    Button(action: {
                        urlArr.append("")
                    }, label: {
                        Image(systemName: "plus.app")
                    }).padding(5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .disabled(urlArr.count >= 16)

                    // play all button
                    Button(action: {
                        userDef.saveURLArray(arr: getStringListSorted(array: urlArr))
                        playAll()
                    }, label: {
                        Image(systemName: "play.rectangle")
                    }).padding(5)
                        .frame(maxWidth: .infinity, alignment: .trailing)

                        .alert(isPresented: $emptyAlert) {
                            Alert(title: Text("At least one URL is required."),
                                  dismissButton: .default(Text("OK"), action: {
                                  }))
                        }

#if os(iOS)
						.fullScreenCover(isPresented: $presentSteamView,onDismiss: {}) {
							NavigationStack {
								StreamView(urlArr: urlArr)
									.toolbar {
										Button(action: {
											self.presentSteamView.toggle()
										}, label: {
											Text("Close")
										})
										Spacer()
									}
							}
                        }
#endif
#if os(tvOS) || os(macOS)
						.sheet(isPresented: $presentSteamView,content: {
							StreamView(urlArr: urlArr)
						})
#endif
//#if os(macOS)
//#endif
                }//H
                // feed list
                List {
                    ForEach(self.urlArr.indices, id: \.self) { i in
                        HStack {
                            TextField("URL\(i + 1)", text: $urlArr[i])
                                .padding(0)
                                .contentShape(Rectangle())
#if !os(tvOS)
                            Button(action: {
                                userDef.saveURLArray(arr: getStringListSorted(array: urlArr))
                                self.selectedFeed = self.urlArr[i]
                            }, label: {
                                Image(systemName: "play.circle")
                            })
#endif
                        }
                    }
                }
            }//V

            if !self.selectedFeed.isEmpty {
                StreamView(urlArr: [self.selectedFeed])
            }
		}
    }
    
    func playAll(){
        let itemCount = getStringArrayCount(array: self.urlArr)
        self.urlArr = getStringListSorted(array: self.urlArr)

        if itemCount <= 0 {
            self.emptyAlert = true
		} else {
            self.presentSteamView.toggle()
        }
    }
}

