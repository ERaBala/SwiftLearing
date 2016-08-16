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
        
         let DEVICE_TOKEN =  NSUserDefaults.standardUserDefaults().stringForKey(userKeyConstant)
         print(DEVICE_TOKEN)
        self.deviceToken.text = DEVICE_TOKEN
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TutorialWebSite(sender: AnyObject) {
        
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


// https://www.raywenderlich.com/123862/push-notifications-tutorial