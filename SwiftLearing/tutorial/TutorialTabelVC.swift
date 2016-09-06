//
//  TutorialTabelVC.swift
//  SwiftLearing
//
//  Created by User on 08/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class TutorialTabelVC: UIViewController {
    
    var ValuesGetFromVC: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let DEVICE_TOKEN =  NSUserDefaults.standardUserDefaults().stringForKey("TUTORIAL_ID")
        print(DEVICE_TOKEN)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func DoneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

}

/* ---------------------- Two Different StoryBoard ----------------------
 
 https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/RefactorStoryboard.html
 http://www.timdietrich.me/blog/swift-multiple-storyboards/
 
 */