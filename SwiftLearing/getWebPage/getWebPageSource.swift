//
//  getWebPageSource.swift
//  SwiftLearing
//
//  Created by User on 25/05/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

let htmlReplaceString   :   String  = "<[^>]+>"
extension String {
    func deleteHTMLTag(tag:String) -> String {
        return self.stringByReplacingOccurrencesOfString("(?i)</?\(tag)\\b[^<]*>", withString: "", options: .RegularExpressionSearch, range: nil)
    }
    
    func deleteHTMLTags(tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag)
        }
        return mutableString
    }
    
    func stripHTML() -> String {
        return self.stringByReplacingOccurrencesOfString(htmlReplaceString, withString: "", options: NSStringCompareOptions.RegularExpressionSearch, range: nil)
    }
}

class getWebPageSource: UIViewController {
    
   var myHTMLString = String()
    
    @IBOutlet weak var PageSourceTextView: UITextView!
    @IBOutlet weak var URLField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //      <--- Example of get tag value.
        let string = "<!DOCTYPE html> <html> <body> <h1>My First Heading</h1> <p>My first paragraph.</p> </body> </html>"
        let str = string.stringByReplacingOccurrencesOfString("<[^>]+>", withString: "", options: .RegularExpressionSearch, range: nil)
        print(str)
        
        
        //  <--- this one for pount symble
        let poundLabel: UILabel = UILabel(frame: CGRectMake(0, 0, 20, 20))
        poundLabel.text = "£"
        self.URLField.leftView = poundLabel
        self.URLField.leftViewMode = .Always
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Action(sender: AnyObject) {
        
        let myURLString = self.URLField?.text
        guard let myURL = NSURL(string: myURLString!) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
             self.myHTMLString = try String(contentsOfURL: myURL)
            let withoutHTMLString = myHTMLString.deleteHTMLTag("title")
            print(withoutHTMLString)
            self.PageSourceTextView.text = String(withoutHTMLString)
            
            myHTMLString.stripHTML()
            
            
            print("HTML : \(myHTMLString)")
        } catch let error as NSError {
            print("Error: \(error)")
        }
    }
    
    /**
     * Called when 'return' key pressed. return NO to ignore.
     */
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}
