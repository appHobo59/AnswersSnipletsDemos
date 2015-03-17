//
//  FlickrPhoto.swift
//  SepiaTones
//
//  Created by Wylene Sweeney on 2/3/15.
//  Open Source MVC Demo
//


import UIKit

class FlickrPhoto: NSObject {
    
    var thumbnail:UIImage!
    var largeImage:UIImage!
    
    var photoID:String!
    var farm:Int!
    var server:String!
    var secret:String!
    
    override init() {
        super.init()
    }
    
}

