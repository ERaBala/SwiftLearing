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
    func deleteHTMLTag(_ tag:String) -> String {
        return self.replacingOccurrences(of: "(?i)</?\(tag)\\b[^<]*>", with: "", options: .regularExpression, range: nil)
    }
    
    func deleteHTMLTags(_ tags:[String]) -> String {
        var mutableString = self
        for tag in tags {
            mutableString = mutableString.deleteHTMLTag(tag)
        }
        return mutableString
    }
    
    func stripHTML() -> String {
        return self.replacingOccurrences(of: htmlReplaceString, with: "", options: NSString.CompareOptions.regularExpression, range: nil)
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
        let str = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        print(str)
        
        
        //  <--- this one for pount symble
        let poundLabel: UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        poundLabel.text = "£"
        self.URLField.leftView = poundLabel
        self.URLField.leftViewMode = .always
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Action(_ sender: AnyObject) {
        
        let myURLString = self.URLField?.text
        guard let myURL = URL(string: myURLString!) else {
            print("Error: \(String(describing: myURLString)) doesn't seem to be a valid URL")
            return
        }
        
        do {
             self.myHTMLString = try String(contentsOf: myURL)
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    /**
     * Called when the user click on the view (outside the UITextField).
     */
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
