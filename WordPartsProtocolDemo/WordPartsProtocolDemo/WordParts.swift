//
//  WordParts.swift
//  WordPartsProtocolDemo
//
//  Created by Wylene Sweeney on 6/23/15.
//  Copyright (c) 2015 techENABLE, Inc. All rights reserved.
//

import Foundation

//Generics constrained with protocol

protocol WordParts {}
extension String: WordParts {}

//06232015 Only accepts strings

struct  ConformsToWordPartsLifoQueue <T: WordParts> {
    
    var wordPieces = [T]()
    
    mutating func enqueue(element:T){
        
        wordPieces.append(element)
        
    }
    
    mutating func dequeue () -> T {
        
        return wordPieces.removeLast()
        
    }
    
}

var wp = ConformsToWordPartsLifoQueue <String>()

/*06232015 var nums should result in error not a string
var nums = ConformsToWordPartsLifoQueue<Float>()

*/
/*06232015 Playground testing data set
wp.enqueue("someday")
wp.enqueue("yesterday")
wp.enqueue("just now")
wp.enqueue("windhejeifb")
wp.enqueue("23")
println(wp.wordPieces)
wp.dequeue()
*/
