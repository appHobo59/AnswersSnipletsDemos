//
//  SlideViewController.swift
//  SepiaTones
//
//  Created by Wylene Sweeney on 2/3/15.
//  Open Source MVC Demo
//

import UIKit

class SlideViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var searchTerm:String!
    
    
    var flickrResults:NSMutableArray! = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        loadPhotos()
        // Do any additional setup after loading the view.
    }
    
    func loadPhotos(){
        let flickr:FlickrPhotos = FlickrPhotos()
        flickr.searchFlickrForString(searchTerm, completion: { (searchString:String!, flickrPhotos:NSMutableArray!, error:NSError!) -> () in
            
            if error == nil{
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.flickrResults = NSMutableArray(array: flickrPhotos)
                    self.collectionView.reloadData()
                    
                    
                    
                })
            }
            
        })
        
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return flickrResults.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        //02262015 this is where the code breaks  received BAD_EXC_ACCESS error
        //Unlike Objective-C where you could "Enable Zombies" to assist in the debug, Swift does not have an option to enable Zombies from the Product==>Scheme menu
        //03012015 Connecting the the UICollectionViewCell to the FlickrSepiaCollectionViewCell class corrected the problem
        
        
        let cell: FlickrSepiaCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("SepiaCell", forIndexPath: indexPath) as FlickrSepiaCollectionViewCell
        
        cell.image = nil
        
        let queue:dispatch_queue_t = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
        
        dispatch_async(queue, { () -> Void in
            var error:NSError?
            
            let searchURL:String = self.flickrResults.objectAtIndex(indexPath.item) as String
            let imageData:NSData = NSData(contentsOfURL: NSURL(string: searchURL)!, options: nil, error: &error)!
            
            if error == nil{
                let image:UIImage = UIImage(data: imageData)!
                
                dispatch_async(dispatch_get_main_queue(), {
                    cell.image = self.applySepiaFilter(image)
                    
                    let yOffset:CGFloat = ((collectionView.contentOffset.y - cell.frame.origin.y) / 200) * 25
                    
                    
                })
                
            }
            
        })
        
        
        return cell
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        
        for view in collectionView.visibleCells(){
            var view:FlickrSepiaCollectionViewCell = view as FlickrSepiaCollectionViewCell
            let yOffset:CGFloat = ((collectionView.contentOffset.y - view.frame.origin.y) / 200) * 25
            
           
            
            
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
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

