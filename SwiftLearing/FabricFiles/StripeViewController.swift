//
//  StripeViewController.swift
//  SwiftLearing
//
//  Created by User on 23/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class StripeViewController: UIViewController {

 /*
    init() {
        // Here, MyAPIAdapter is your class that implements STPBackendAPIAdapter (see above)
        self.paymentContext = STPPaymentContext(apiAdapter: MyAPIAdapter())
        super.init(nibName: nil, bundle: nil)
        self.paymentContext.delegate = self
        self.paymentContext.hostViewController = self
        self.paymentContext.paymentAmount = 5000 // Measured in cents, i.e. $50 USD
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func paymentContextDidChange(paymentContext: STPPaymentContext) {
        self.activityIndicator.animating = paymentContext.loading
        self.paymentButton.enabled = paymentContext.selectedPaymentMethod != nil
        self.paymentLabel.text = paymentContext.selectedPaymentMethod?.label
        self.paymentIcon.image = paymentContext.selectedPaymentMethod?.image
    }

    func paymentContext(paymentContext: STPPaymentContext,
                        didCreatePaymentResult paymentResult: STPPaymentResult,
                                               completion: STPErrorBlock) {
        
        myAPIClient.createCharge(paymentResult.source.stripeID, completion: { (error: NSError?) in
            if let error = error {
                completion(error)
            } else {
                completion(nil)
            }
        })
    }
    
    func paymentContext(paymentContext: STPPaymentContext,
                        didFinishWithStatus status: STPPaymentStatus,
                                            error: NSError?) {
        
        switch status {
        case .Error:
            self.showError(error)
        case .Success:
            self.showReceipt()
        case .UserCancellation:
            return // Do nothing
        }
    }
    
    func paymentContext(paymentContext: STPPaymentContext,
                        didFailToLoadWithError error: NSError) {
        self.navigationController?.popViewControllerAnimated(true)
        // Show the error to your user, etc.
    }
    
    // If you prefer a modal presentation
    func choosePaymentButtonTapped() {
        self.paymentContext.presentPaymentMethodsViewController()
    }
    
    // If you prefer a navigation transition
    func choosePaymentButtonTapped() {
        self.paymentContext.pushPaymentMethodsViewController()
    }
    
    func payButtonTapped() {
        self.paymentContext.requestPayment()
    }
  */
}
