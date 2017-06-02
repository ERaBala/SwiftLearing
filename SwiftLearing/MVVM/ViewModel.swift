//
//  ViewModel.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/2/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class ViewModel{
    
    private var model : Model
    
    var nameTxt: String {
        let nameStr : String = "Emplo Name is " + model.empName
        return nameStr
    }
    
    var ageCal : Int {
        return model.empAge
    }
    
    var depart : String{
        return model.empEnvironment
    }
    
    var imag : String{
        return model.empProfilePic
    }
    
    init(model: Model) {
        self.model = model
    }
}
