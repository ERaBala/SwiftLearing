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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}



/* ---------------------- Two Different StoryBoard ----------------------
 https://developer.apple.com/library/ios/recipes/xcode_help-IB_storyboard/Chapters/RefactorStoryboard.html
 http://www.timdietrich.me/blog/swift-multiple-storyboards/
 
 */