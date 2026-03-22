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
	let kPlayWhenOpen = "kPlayWhenOpen"


    func readURLArray() -> Array<String>{
        return keyStore.array(forKey: kURLArr) as? [String] ?? []
    }
    
    func saveURLArray(arr: Array<String>){
        keyStore.set(arr, forKey: kURLArr)
        keyStore.synchronize()
    }

	func getPlayWhenOpen() -> Bool {
		let isOn = keyStore.bool(forKey: kPlayWhenOpen)
		print("getPlayWhenOpen is \(isOn)")
		return isOn
	}
	func setPlayWhenOpen(_ isOn: Bool){
		print("set PlayWhenOpen to \(isOn)")
		keyStore.set(isOn, forKey: kPlayWhenOpen)
		keyStore.synchronize()
	}
}
