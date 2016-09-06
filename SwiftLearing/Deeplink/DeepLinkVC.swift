//
//  DeepLinkVC.swift
//  SwiftLearing
//
//  Created by Bala on 06/09/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class DeepLinkVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SafariLink(sender: AnyObject) {
        let openLink = NSURL(string : "http://smartbala29.blogspot.in/2016/09/function-startmyapp-document_6.html")
        UIApplication.sharedApplication().openURL(openLink!)
    }
    
//      http://www.brianjcoleman.com/tutorial-deep-linking-in-swift/
    
}
