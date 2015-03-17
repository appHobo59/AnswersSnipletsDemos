//
//  ViewController.swift
//  SepiaTones
//
//  Created by Wylene Sweeney on 2/3/15.
//  Open Source MVC Demo
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.becomeFirstResponder()
        searchBar.delegate = self
        searchBar.text = "black and white photos"
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationViewController:SlideViewController = segue.destinationViewController as SlideViewController
        
        if !searchBar.text.isEmpty{
            destinationViewController.searchTerm = searchBar.text
        }else{
            
            let alert:UIAlertController = UIAlertController(title: "Flicker Photo Search", message: "Please enter photo category to search", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            self.presentViewController(alert, animated: true, completion: nil)
            
            
            
            
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

