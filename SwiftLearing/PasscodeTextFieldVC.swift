//
//  PasscodeTextFieldVC.swift
//  SwiftLearing
//
//  Created by User on 26/07/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

extension String {
    
    func toAttributedString(font borderWidth:CGFloat!, cornerRadius: CGFloat!, borderColor:CGColor!) -> NSAttributedString {
        return NSAttributedString(string: self as String, borderWidth: borderWidth, cornerRadius: cornerRadius, borderColor: borderColor)!
    }
}

extension NSAttributedString {
    
    convenience init?(string text:String, borderWidth:CGFloat!, cornerRadius: CGFloat!, borderColor:CGColor!) {
        self.init(string: text, attributes: [ NSFontAttributeName:borderWidth, NSKernAttributeName:cornerRadius, NSForegroundColorAttributeName:borderColor])
    }
}


class PasscodeTextFieldVC: UIViewController,UITextFieldDelegate {
     
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var textFieldFour: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textFieldOne.delegate = self
        textFieldTwo.delegate = self
        textFieldThree.delegate = self
        textFieldFour.delegate = self
        
        textFieldOne.layer.borderWidth = 1
        textFieldOne.layer.cornerRadius = 5
        textFieldOne.layer.masksToBounds = true
        textFieldOne.layer.borderColor = UIColor(red: 0.94, green: 0.58, blue: 0.20, alpha: 1).cgColor
//        textFieldOne.userInteractionEnabled = false
       
        
        textFieldTwo.layer.borderWidth = 1
        textFieldTwo.layer.cornerRadius = 5
        textFieldTwo.layer.masksToBounds = true
        textFieldTwo.layer.borderColor = UIColor(red: 0.94, green: 0.58, blue: 0.20, alpha: 1).cgColor
//        textFieldTwo.userInteractionEnabled = false

        textFieldThree.layer.borderWidth = 1
        textFieldThree.layer.cornerRadius = 5
        textFieldThree.layer.masksToBounds = true
        textFieldThree.layer.borderColor = UIColor(red: 0.94, green: 0.58, blue: 0.20, alpha: 1).cgColor
//        textFieldThree.userInteractionEnabled = false

        
        textFieldFour.layer.borderWidth = 1
        textFieldFour.layer.cornerRadius = 5
        textFieldFour.layer.masksToBounds = true
        textFieldFour.layer.borderColor = UIColor(red: 0.94, green: 0.58, blue: 0.20, alpha: 1).cgColor
//        textFieldFour.userInteractionEnabled = false
        
        textFieldFour.keyboardType = UIKeyboardType.numberPad
        
        textFieldOne.addTarget(self, action: #selector(PasscodeTextFieldVC.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        textFieldTwo.addTarget(self, action: #selector(PasscodeTextFieldVC.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        textFieldThree.addTarget(self, action: #selector(PasscodeTextFieldVC.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        textFieldFour.addTarget(self, action: #selector(PasscodeTextFieldVC.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
    
    }

 
    
    func textFieldDidChange(_ textField: UITextField){
        
        let text = textField.text
      
            if text?.utf16.count==1{
                switch textField{
                case textFieldOne:
                    textFieldTwo.becomeFirstResponder()
                case textFieldTwo:
                    textFieldThree.becomeFirstResponder()
                case textFieldThree:
                    textFieldFour.becomeFirstResponder()
                case textFieldFour:
                    textFieldFour.resignFirstResponder()
                default:
                    textFieldOne.becomeFirstResponder()
                }
            }else{
                switch textField{
                case textFieldFour:
                    textFieldThree.becomeFirstResponder()
                case textFieldThree:
                    textFieldTwo.becomeFirstResponder()
                case textFieldTwo:
                    textFieldOne.becomeFirstResponder()
                case textFieldOne:
                    textFieldOne.resignFirstResponder()
                default:
                    textFieldOne.becomeFirstResponder()
                }
            }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
 
        if (textFieldOne.text == "" || textFieldTwo.text ==  "" || textFieldThree.text == "" || textFieldFour.text == "")
        {
//            responder()
            print("somthing")
        }else{
            print("udsgfgs")
//            textFieldFour.becomeFirstResponder()  
            
        }
    }
    
    func responder(){
        self.textFieldOne.becomeFirstResponder()
    }
    /*
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    /*
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
  
    

}
