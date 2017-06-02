//
//  PushNotificationVC.swift
//  SwiftLearing
//
//  Created by User on 22/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class PushNotificationVC: UIViewController {

     let userKeyConstant = "DeviceToken"
    
    @IBOutlet weak var deviceToken: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         let DEVICE_TOKEN =  UserDefaults.standard.string(forKey: userKeyConstant)
         print(DEVICE_TOKEN ?? "DEVICE_TOKEN Values is Empty")
        self.deviceToken.text = DEVICE_TOKEN
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TutorialWebSite(_ sender: AnyObject) {
        
        
        
    }
}


// https://www.raywenderlich.com/123862/push-notifications-tutorial
