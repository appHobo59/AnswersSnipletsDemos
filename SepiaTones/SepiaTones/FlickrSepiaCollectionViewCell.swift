//
//  FlickrSepiaCollectionViewCell.swift
//  SepiaTones
//
//  Created by Wylene Sweeney on 3/1/15.
//  Copyright (c) 2015 techENABLE, Inc. All rights reserved.
//

import Foundation
import UIKit
import CoreImage

class FlickrSepiaCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    var image:UIImage!{
        get{
            
            return self.image
        }
        
        set{
            self.imageView.image = newValue
            
//            if imageOffset != nil{
//                setImageOffset(imageOffset)
//            }else{
//               setImageOffset(CGPointMake(0, 0))
//            }
//            
        }
        
    }
    let indicator: UIActivityIndicatorView!
    
    //var imageOffset:CGPoint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                setupImageView()
        
        
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
        imageView.addObserver(self, forKeyPath: "image", options: nil, context: nil)
        indicator = UIActivityIndicatorView()
        backgroundColor = UIColor.blackColor()
        indicator.center = self.imageView.center
        indicator.activityIndicatorViewStyle = .WhiteLarge
        indicator.stopAnimating()
        addSubview(indicator)
        
    }
    
    func setupImageView(){
        self.clipsToBounds = true
        
        imageView = UIImageView(frame: CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 320, 200))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = false
        
        
        self.addSubview(imageView)
        
        
    }
    
    deinit {
        imageView.removeObserver(self, forKeyPath: "image")
    }
    
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "image" {
            indicator.startAnimating()
        }
    }
    
    
    func applySepiaFilter(image:UIImage) -> UIImage? {
        let inputImage = CIImage(data:UIImagePNGRepresentation(image))
        let context = CIContext(options:nil)
        let filter = CIFilter(name:"CISepiaTone")
        filter.setValue(inputImage, forKey: kCIInputImageKey)
        filter.setValue(0.8, forKey: "inputIntensity")
        if let outputImage = filter.outputImage {
            let outImage = context.createCGImage(outputImage, fromRect: outputImage.extent())
            
            return UIImage(CGImage: outImage)
            
        }
        return nil
        
    }
    
    
}
