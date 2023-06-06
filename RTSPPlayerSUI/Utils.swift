//
//  Utils.swift
//  RTSPPlayerSUI
//
//  Created by bi119aTe5hXk on 2023/06/06.
//

import Foundation

func getStringListSorted(array:Array<String>) -> Array<String> {
    var arrayCopy = Array<String>.init()
    
    for item in array{
        if !item.isEmpty{
            arrayCopy.append(item)
        }
    }
    arrayCopy.sort { $1 < $0 }
    return arrayCopy
}

func getStringArrayCount(array:Array<String>) -> Int{
    var arrayCopy = array
    arrayCopy.sort { $1 < $0 }
    
    var itemCount = 0
    for item in arrayCopy{
        if !item.isEmpty{
            itemCount += 1
        }
    }
    return itemCount
}
