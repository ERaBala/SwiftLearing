//
//  LocalNotificationVC.swift
//  SwiftLearing
//
//  Created by User on 20/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class LocalNotificationVC: UIViewController {

    @IBOutlet weak var NotificationTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func LocalNotificationActionbutton(sender: AnyObject) {
//        if NotificationTextField.text == ""
//        {
            let localNotification = UILocalNotification()
            localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
            localNotification.alertBody = self.NotificationTextField.text
            localNotification.timeZone = NSTimeZone.defaultTimeZone()
            localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber + 1
            UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
//        }
    }

}