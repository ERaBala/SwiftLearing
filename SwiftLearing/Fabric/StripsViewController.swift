//
//  StripsViewController.swift
//  SwiftLearing
//
//  Created by User on 22/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
//import Stripe

class StripsViewController: UIViewController {

//    var paymentTextField: STPPaymentCardTextField! = nil
//    var submitButton: UIButton! = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
//        paymentTextField = STPPaymentCardTextField(frame: CGRectMake(15, 30, CGRectGetWidth(view.frame) - 30, 44))
//        paymentTextField.delegate = self
//        view.addSubview(paymentTextField)
//        submitButton = UIButton(type: UIButtonType.System)
//        submitButton.frame = CGRectMake(15, 100, 100, 44)
//        submitButton.enabled = false
//        submitButton.setTitle("Submit", forState: UIControlState.Normal)
//        submitButton.addTarget(self, action: #selector(self.submitCard(_ :)), forControlEvents: UIControlEvents.TouchUpInside)
//        view.addSubview(submitButton)

    }

//    func paymentCardTextFieldDidChange(textField: STPPaymentCardTextField) {
//        submitButton.enabled = textField.valid
//    }
//    
//    @IBAction func submitCard(sender: AnyObject?) {
//        // If you have your own form for getting credit card information, you can construct
//        // your own STPCardParams from number, month, year, and CVV.
//        let card = paymentTextField.card!
//        
//        STPAPIClient.sharedClient().createTokenWithCard(card) { token, error in
//            guard let stripeToken = token else {
//                NSLog("Error creating token: %@", error!.localizedDescription);
//                return
//            }
//            
//            // TODO: send the token to your server so it can create a charge
//            let alert = UIAlertController(title: "Welcome to Stripe", message: "Token created: \(stripeToken)", preferredStyle: .Alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//        }
//    }


}
