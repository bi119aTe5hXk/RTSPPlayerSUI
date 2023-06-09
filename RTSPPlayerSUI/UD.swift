//
//  UD.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/05.
//

import Foundation

class UD {
    var keyStore = NSUbiquitousKeyValueStore()
    let kURLArr = "kURLArr"
    
    func readURLArray() -> Array<String>{
        return keyStore.array(forKey: kURLArr) as? [String] ?? []
    }
    
    func saveURLArray(arr: Array<String>){
        keyStore.set(arr, forKey: kURLArr)
        keyStore.synchronize()
    }
    
    init() {
        UserDefaults.standard.register(defaults: [kURLArr:[""]])
    }
}
