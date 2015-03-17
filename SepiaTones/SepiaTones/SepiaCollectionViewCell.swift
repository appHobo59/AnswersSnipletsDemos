//
//  SepiaCollectionViewCell.swift
//  SepiaTones
//
//  Created by Wylene Sweeney on 2/3/15.
//  Open Source MVC Demo
//

import UIKit
import CoreImage

class SepiaCollectionViewCell: UICollectionViewCell {
    
    var imageView:UIImageView!
    var image:UIImage!{
        get{
            
            return self.image
        }
        
        set{
            self.imageView.image = newValue
            
            if imageOffset != nil{
                setImageOffset(imageOffset)
            }else{
                setImageOffset(CGPointMake(0, 0))
            }
            
        }
        
    }
    
    var imageOffset:CGPoint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImageView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImageView()
    }
    
    func setupImageView(){
        self.clipsToBounds = true
        
        imageView = UIImageView(frame: CGRectMake(self.bounds.origin.x, self.bounds.origin.y, 320, 200))
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = false
        self.addSubview(imageView)
        
    }
    
    func setImageOffset(imageOffset:CGPoint){
        
        self.imageOffset = imageOffset
        
        let frame:CGRect = imageView.bounds
        let offsetFrame:CGRect = CGRectOffset(frame, self.imageOffset.x, self.imageOffset.y)
        imageView.frame = offsetFrame
        
        
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
