//
//  UD.swift
//  RTSP4Player
//
//  Created by bi119aTe5hXk on 2023/06/05.
//

import Foundation

class UD {
    
    let userDefaults = UserDefaults.standard
    let kURLArr = "kURLArr"
    
    func readURLArray() -> Array<String>{
        return userDefaults.array(forKey: kURLArr) as? [String] ?? []
    }
    
    func saveURLArray(arr: Array<String>){
        userDefaults.setValue(arr, forKey: kURLArr)
        userDefaults.synchronize()
    }
    
    init() {
        let arr = Array(repeating: "", count: 16)
        UserDefaults.standard.register(defaults: [kURLArr:arr])
    }
}
