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
    @IBOutlet weak var CardNumberTF: TxtFieldGloabClass!
    @IBOutlet weak var ExpireDateTF: TxtFieldGloabClass!
    @IBOutlet weak var CVCTF: TxtFieldGloabClass!
    @IBOutlet weak var AmountTF: TxtFieldGloabClass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//       self.CVCTF = TxtFieldGloabClass.ErrorTextField(<#T##TxtFieldGloabClass#>)
    self.EmailTxtField.delegate = self
        // Do any additional setup after loading the view.
    }
    /*
/*    func paymentContextDidChange(paymentContext: STPPaymentContext) {
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
            return // do nothing
        }
        
    }
    
    func paymentContext(paymentContext: STPPaymentContext,
                        didFailToLoadWithError error: NSError) {
        self.navigationController?.popViewControllerAnimated(true)
        // show the error to your user, etc
    }
    
    init() {
        // Here, MyAPIAdapter is your class that implements STPBackendAPIAdapter (see above)
        self.paymentContext = STPPaymentContext(apiAdapter: MyAPIAdapter())
        super.init(nibName: nil, bundle: nil)
        self.paymentContext.delegate = self
        self.paymentContext.hostViewController = self
        self.paymentContext.paymentAmount = 5000 // measured in cents, i.e. $50 USD
    }
    
    // If you prefer a navigation transition
    func choosePaymentButtonTapped() {
        self.paymentContext.pushPaymentMethodsViewController()
    }
    
    func payButtonTapped() {
        self.paymentContext.requestPayment()
    }
    */
    
    @IBAction func SaveBtn(sender: AnyObject) {
        // Initiate the card
        let stripCard = STPCard()

        // Split the expiration date to extract Month & Year
        if self.ExpireDateTF.text!.isEmpty == false {
            let expirationDate = self.ExpireDateTF.text!.componentsSeparatedByString("/")
            let expMonth = UInt(Int(expirationDate[0])!)
            let expYear = UInt(Int(expirationDate[1])!)
            
            // Send the card info to Strip to get the token
            stripCard.number = self.CardNumberTF.text
            stripCard.cvc = self.CardNumberTF.text
            stripCard.expMonth = expMonth
            stripCard.expYear = expYear
        }
        
        var underlyingError: NSError?
        do {
            try stripCard.validateCardReturningError()
        } catch let error as NSError {
            underlyingError = error
        }
        if underlyingError != nil {
//            self.spinner.stopAnimating()
            self.handleError(underlyingError!)
            return
        }
        
        STPAPIClient.sharedClient().createTokenWithCard(stripCard, completion: { (token, error) -> Void in
            
            if error != nil {
                self.handleError(error!)
                return
            }
            print(token)
//            self.postStripeToken(token!)
        })

       
    }
    
    func handleError(error: NSError) {
        print(error)
        InGlobalFile.Aleart(Title:"Please Try Again",Message: error.localizedDescription,btnTitle: "ok") .ShowAleartFunction()
    }
    
    func postStripeToken(token: STPToken) {
        
        let URL = "http://localhost/donate/payment.php"
        let params = ["stripeToken": token.tokenId]
//            ,["amount": self.AmountTF.text!],["currency": "usd"],["description": self.EmailTxtField.text]]
        
        //        other than  , "amount": self.AmountTF.text!.toInt()!, "currency": "usd", "description": self.EmailTxtField.text
        
        let manager = AFHTTPRequestOperationManager()
        manager.POST(URL, parameters: params, success: { (operation, responseObject) -> Void in
            
            if let response = responseObject as? [String: String] {
                UIAlertView(title: response["status"],
                    message: response["message"],
                    delegate: nil,
                    cancelButtonTitle: "OK").show()
            }
            
        }) { (operation, error) -> Void in
            self.handleError(error!)
        }
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
   
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
*/
}

//    https://www.appcoda.com/ios-stripe-payment-integration/