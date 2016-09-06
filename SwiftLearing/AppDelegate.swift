//
//  AppDelegate.swift
//  SwiftLearing
//
//  Created by User on 24/05/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
//import Stripe

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var loadedEnoughToDeepLink : Bool = false
    var deepLink : RemoteNotificationDeepLink?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        if(UIApplication.instancesRespondToSelector(#selector(UIApplication.registerUserNotificationSettings(_:)))) {
            UIApplication.sharedApplication().registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: nil))
        }
        
        let types: UIUserNotificationType = [UIUserNotificationType.Badge ,
            UIUserNotificationType.Alert,
            UIUserNotificationType.Sound]
        
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(forTypes: types, categories: nil)
        
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        
//         ==================== Stripe Configuration ==================== //
//        STPPaymentConfiguration.sharedConfiguration().publishableKey = "pk_test_4bQMrrawci1v0iZeTC0AR3wU"
//        STPPaymentConfiguration.sharedConfiguration().appleMerchantIdentifier = "merchant.com.ibtest.app"

        return true
    }
    
  
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification)
    {
        application.applicationIconBadgeNumber = 1000
    }
    
    
    func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != .None {
            application.registerForRemoteNotifications()
        }
    }
    
//     ====================  get Device token to send for Push notification  ==================== //
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        let characterSet: NSCharacterSet = NSCharacterSet(charactersInString: "<>")
        
        let deviceTokenString: String = (deviceToken.description as NSString)
            .stringByTrimmingCharactersInSet(characterSet)
            .stringByReplacingOccurrencesOfString( " ", withString: "") as String
        
        print(deviceTokenString)
        InGlobalFile.UserDefaultFunction(defaultName: deviceTokenString, defaultKey: "DeviceToken") .NSStringForKey()
    }
    
    
//     ============================= Deep Link Methods ============================= //
    
    
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
        
        if url.host == nil
        {
            return true;
        }
        
        let urlString = url.absoluteString
        let queryArray = urlString.componentsSeparatedByString("/")
        let query = queryArray[2]
        
        // Check if article
        if query.rangeOfString("article") != nil
        {
            let data = urlString.componentsSeparatedByString("/")
            if data.count >= 3
            {
                let parameter = data[3]
                let userInfo = [RemoteNotificationDeepLinkAppSectionKey : parameter ]
                self.applicationHandleRemoteNotification(application, didReceiveRemoteNotification: userInfo)
            }
        }
        
        return true
    }
    
    func applicationHandleRemoteNotification(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject])
    {
        if application.applicationState == UIApplicationState.Background || application.applicationState == UIApplicationState.Inactive
        {
            let canDoNow = loadedEnoughToDeepLink
            
            self.deepLink = RemoteNotificationDeepLink.create(userInfo)
            
            if canDoNow
            {
                self.triggerDeepLinkIfPresent()
            }
        }
    }
    
    func triggerDeepLinkIfPresent() -> Bool
    {
        self.loadedEnoughToDeepLink = true
        let ret = (self.deepLink?.trigger() != nil)
        self.deepLink = nil
        return ret
    }

    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    

}

