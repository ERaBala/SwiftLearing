//
//  StripsViewController.swift
//  SwiftLearing
//
//  Created by User on 22/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit
import Stripe

class StripsViewController: UIViewController , STPPaymentCardTextFieldDelegate {

    var paymentTextField: STPPaymentCardTextField! = nil
    var submitButton: UIButton! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentTextField = STPPaymentCardTextField(frame: CGRect(x: 15, y: 30, width: view.frame.width - 30, height: 44))
        paymentTextField.delegate = self
        view.addSubview(paymentTextField)
        
        submitButton = UIButton(type: .system)
        submitButton.frame = CGRect(x: 15, y: 100, width: 100, height: 44)
        submitButton.isEnabled = false
        submitButton.setTitle("Submit", for: [])
        submitButton.addTarget(self, action: #selector(self.submitCard(_:)), for: .touchUpInside)
        view.addSubview(submitButton)
        
    }
    
    func paymentCardTextFieldDidChange(_ textField: STPPaymentCardTextField) {
        submitButton.isEnabled = textField.isValid
    }
    
    @IBAction func submitCard(_ sender: AnyObject?) {
        // If you have your own form for getting credit card information, you can construct
        // your own STPCardParams from number, month, year, and CVV.
        let cardParams = paymentTextField.cardParams
        
        STPAPIClient.shared().createToken(withCard: cardParams) { token, error in
            guard let stripeToken = token else {
                NSLog("Error creating token: %@", error!.localizedDescription);
                return
            }
            
            // TODO: send the token to your server so it can create a charge
            let alert = UIAlertController(title: "Welcome to Stripe", message: "Token created: \(stripeToken)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}
