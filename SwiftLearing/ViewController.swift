//
//  ViewController.swift
//  SwiftLearing
//
//  Created by User on 24/05/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     var arrRegistration  = [Dictionary <String, AnyObject>]()
    
    @IBOutlet weak var JsonTextview: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getJSONForUI()   // <-- methode calling
        
        // how to get single by single values
        for i in 0 ..< arrRegistration.count {
            let dict = arrRegistration[i] as Dictionary<String,AnyObject>
           print(dict)
        }
    }


    func getJSONForUI(){
        let fileUrl: URL = Bundle.main.url(forResource: "Registration", withExtension: "json")!
        let jsonData: Data = try! Data(contentsOf: fileUrl)
        
        /*      ERROR Message and array value of arrRegistration
        let jsonError: NSError?
        let arr: NSArray = (try! NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)) as! NSArray
        print("ARRAY******\(arr)")
         */
        
        let json = (try! JSONSerialization.jsonObject(with: jsonData, options: .allowFragments))
        self.arrRegistration = json as! Array
//        print("\(self.arrRegistration)")
        
        self.JsonTextview.text = String(describing: arrRegistration)  //<-- dict convert in to string
        
    }
    
}

