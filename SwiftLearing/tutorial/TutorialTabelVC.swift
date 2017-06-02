//
//  TutorialTabelVC.swift
//  SwiftLearing
//
//  Created by User on 08/08/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class TutorialTabelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let DEVICE_TOKEN =  UserDefaults.standard.string(forKey: "TUTORIAL_ID")
        print(DEVICE_TOKEN ?? "There is no Device Token")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func DoneButton(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
}

/* ---------------------- Two Different StoryBoard ----------------------
 https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/RefactorStoryboard.html
 http://www.timdietrich.me/blog/swift-multiple-storyboards/
 
 */
