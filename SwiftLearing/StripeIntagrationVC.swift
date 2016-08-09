//
//  StripeIntagrationVC.swift
//  SwiftLearing
//
//  Created by User on 08/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class StripeIntagrationVC: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var EmailTxtField: TxtFieldGloabClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.EmailTxtField.delegate = self
        
        self.EmailTxtField.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


//    https://www.appcoda.com/ios-stripe-payment-integration/