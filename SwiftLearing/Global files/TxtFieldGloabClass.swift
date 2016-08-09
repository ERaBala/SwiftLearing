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
        createBorder()
    }
    
    func createBorder(){
        let border = CALayer()
        let width = CGFloat(2.0)
        border.borderColor = UIColor(red: 0.94, green: 0.58, blue: 0.20, alpha: 1).CGColor
        border.frame = CGRect(x: 0, y: self.frame.size.height-width, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        border.borderWidth = 1
        border.cornerRadius = 5
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        //print("border created")
    }

}
