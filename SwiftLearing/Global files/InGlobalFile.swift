//
//  InGlobalFile.swift
//  SwiftLearing
//
//  Created by User on 28/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class InGlobalFile: NSObject {
    
    struct  UserDefaultFunction {
        
        var defaultName: String
        var defaultKey: String
        
        func NSStringForKey()
        {
            UserDefaults.standard.set(defaultName, forKey: defaultKey)
            //  InGlobalFile.UserDefaultFunction(defaultName: deviceTokenString, defaultKey: "DeviceToken") .NSStringForKey()  // include this
        }
    }
    
    struct Aleart {
        
        var Title: String
        var Message: String
        var btnTitle: String
        
        func ShowAleartFunction()
        {
            let alert = UIAlertView()
            alert.title = Title
            alert.message = Message
            alert.addButton(withTitle: btnTitle)
            alert.show()
        }
    }

}
