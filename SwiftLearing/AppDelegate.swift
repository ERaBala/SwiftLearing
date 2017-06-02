//
//  AppDelegate.swift
//  SwiftLearing
//
//  Created by User on 24/05/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import Fabric
import Stripe
import Crashlytics


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let EmpDetails : [ViewModel] = {
        
        let Bala = Model(Name : "Bala", Age: 23, Environment: "ios", ProfilePic: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let tyzon = Model(Name : "Tyson", Age: 26, Environment: "ios", ProfilePic: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let nas = Model(Name : "Nas", Age: 25, Environment: "Android", ProfilePic: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        let sesha = Model(Name : "Sesha", Age: 70, Environment: "PHP", ProfilePic: "http://auto.ferrari.com/en_EN/wp-content/uploads/sites/5/2013/07/Ferrari-F12berlinetta.jpg")
        
        return[ ViewModel(model : Bala),ViewModel(model : tyzon),ViewModel(model : nas),ViewModel(model : sesha)]
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if(UIApplication.instancesRespond(to: #selector(UIApplication.registerUserNotificationSettings(_:)))) {
            UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: [.sound, .alert, .badge], categories: nil))
        }
        
        let types: UIUserNotificationType = [UIUserNotificationType.badge ,
            UIUserNotificationType.alert,
            UIUserNotificationType.sound]
        
        let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: types, categories: nil)
        
        application.registerUserNotificationSettings(settings)
        application.registerForRemoteNotifications()
        


        // TODO: Replace with your own test publishable key
        // TODO: DEBUG ONLY! Remove / conditionalize before launch
        Stripe.setDefaultPublishableKey("pk_test_6pRNASCoBOKtIshFeQd4XMUh")
        Fabric.with([STPAPIClient.self, Crashlytics.self])

        return true
    }
    
  
    func application(_ application: UIApplication, didReceive notification: UILocalNotification)
    {
        application.applicationIconBadgeNumber = 0
    }
    
    
    func application(_ application: UIApplication, didRegister notificationSettings: UIUserNotificationSettings) {
        if notificationSettings.types != UIUserNotificationType() {
            application.registerForRemoteNotifications()
        }
    }
    
    // ====================  get Device token to send for Push notification  ==================== //
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        let characterSet: CharacterSet = CharacterSet(charactersIn: "<>")
        
        let deviceTokenString: String = (deviceToken.description as NSString)
            .trimmingCharacters(in: characterSet)
            .replacingOccurrences( of: " ", with: "") as String
        
        print(deviceTokenString)
//        InGlobalFile.UserDefaultFunction(defaultName: deviceTokenString, defaultKey: "DeviceToken") .NSStringForKey()
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        // handle url here
        return true
    }

}

