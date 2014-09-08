//
//  ViewController.swift
//  Web Service Example
//
//  Created by ANDREW VARVEL on 8/09/2014.
//  Copyright (c) 2014 Andrew Varvel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var myNameLabel: UILabel!
                            
    @IBOutlet weak var rainbowWheel: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let manager = AFHTTPRequestOperationManager()
        rainbowWheel.hidden = false
        rainbowWheel.hidesWhenStopped = true
        rainbowWheel.startAnimating()
 
        manager.GET( "http:/graph.facebook.com/andrewv",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                self.rainbowWheel.stopAnimating()
                println("JSON: " + responseObject.description)
                if let myName = responseObject.valueForKey("name") as? String {
                    self.myNameLabel.text = myName;
                }
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                self.rainbowWheel.stopAnimating()

                println("Error: " + error.localizedDescription)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

