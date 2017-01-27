//
//  TxtFieldGloabClass.swift
//  SwiftLearing
//
//  Created by User on 09/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class TxtFieldGloabClass: UITextField {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0;
        self.layer.borderColor = UIColor(red: 0.94, green: 0.58, blue: 0.20, alpha: 1).cgColor
        self.layer.borderWidth = 1.5
        self.backgroundColor = UIColor.white
        self.textColor = UIColor.white
        self.tintColor = UIColor.purple
        
    }
    
    
}
