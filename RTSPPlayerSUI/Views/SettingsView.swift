//
//  ContentView.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/05.
//

import SwiftUI

struct SettingsView: View {
    var userDef:UD
    @State var urlArr:[String]
    @State private var emptyAlert = false
    
    @State private var presentSteam1View = false
    @State private var presentSteam4View = false
    @State private var presentSteam9View = false
    @State private var presentSteam16View = false
    
    init() {
        userDef = UD()
        urlArr = userDef.readURLArray()
        //print(urlArr)
    }
    var body: some View {
        HStack{
            
            Button(action: {
                urlArr.append("")
            }, label: {
                Image(systemName: "plus.app")
            })
            .foregroundColor(.blue)
            .padding(5)
            .frame(maxWidth:
                    .infinity,
                   alignment:
                    .leading)
            .disabled(urlArr.count >= 16)
            
            Button (action: {
                userDef.saveURLArray(arr: getStringListSorted(array: urlArr))
                
                let itemCount = getStringArrayCount(array: urlArr)
                urlArr = getStringListSorted(array: urlArr)
                
                if (itemCount <= 0){
                    emptyAlert = true
                }else if(itemCount == 1){
                    presentSteam1View.toggle()
                }else if(itemCount <= 4){
                    presentSteam4View.toggle()
                }else if(itemCount <= 9){
                    presentSteam9View.toggle()
                }else{
                    presentSteam16View.toggle()
                }
            },label: {
                Image(systemName: "play.square")
            }).padding(5)
                .frame(maxWidth:
                        .infinity,
                       alignment:
                        .trailing)
            
                .alert(isPresented: $emptyAlert) {
                    Alert(title: Text("At least one URL is required."),
                          dismissButton: .default(Text("OK"), action: {
                          }))
                }
                .sheet(isPresented: $presentSteam1View,
                       content: {
                    Stream1View(urlArr: urlArr)
                })
                .sheet(isPresented: $presentSteam4View,
                       content: {
                    Stream4View(urlArr: urlArr)
                })
                .sheet(isPresented: $presentSteam9View,
                       content: {
                    Stream9View(urlArr: urlArr)
                })
                .sheet(isPresented: $presentSteam16View,
                       content: {
                    Stream16View(urlArr: urlArr)
                })

        }
        List{
            ForEach(self.urlArr.indices, id: \.self) { i in
                TextField("URL\(i + 1)", text: $urlArr[i])
                    .padding(5)
            }
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
