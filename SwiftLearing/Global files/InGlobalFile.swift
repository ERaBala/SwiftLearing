//
//  InGlobalFile.swift
//  SwiftLearing
//
//  Created by User on 28/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class InGlobalFile: NSObject {
    
    struct  UserDefaultSample {
        
        var defaultName: String
        var defaultKey: String
        
        func NSStringForKey()
        {
            NSUserDefaults.standardUserDefaults().setObject(defaultName, forKey: defaultKey)
            //  InGlobalFile.UserDefaultSample(defaultName: deviceTokenString, defaultKey: "DeviceToken") .NSStringForKey()  // include this 
        }
    }

    
    
}
