//
//  Model.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/2/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class Model {

    var empName : String
    var empAge  : Int
    var empEnvironment : String
    var empProfilePic : String
    
    init(Name : String, Age: Int, Environment: String, ProfilePic: String) {
        self.empName = Name
        self.empAge = Age
        self.empEnvironment = Environment
        self.empProfilePic = ProfilePic
    }
    
    
}
