//
//  RemoteNotificationDeepLink.swift
//  DeepLink
//
//  Created by Brian Coleman on 2015-07-12.
//  Copyright (c) 2015 Brian Coleman. All rights reserved.
//

import UIKit

let RemoteNotificationDeepLinkAppSectionKey : String = "article"

class RemoteNotificationDeepLink: NSObject {
   
    var article : String = ""
    
    class func create(userInfo : [NSObject : AnyObject]) -> RemoteNotificationDeepLink?
    {
        let info = userInfo as NSDictionary
        
        let articleID = info.objectForKey(RemoteNotificationDeepLinkAppSectionKey) as! String
        
        var ret : RemoteNotificationDeepLink? = nil
        if !articleID.isEmpty
        {
            ret = RemoteNotificationDeepLinkArticle(articleStr: articleID)
        }
        return ret
    }
    
    private override init()
    {
        self.article = ""
        super.init()
    }
    
    private init(articleStr: String)
    {
        self.article = articleStr
        super.init()
    }
    
    final func trigger()
    {
        dispatch_async(dispatch_get_main_queue())
            {
                //NSLog("Triggering Deep Link - %@", self)
                self.triggerImp()
                    { (passedData) in
                        // do nothing
                }
        }
    }
    
    private func triggerImp(completion: ((AnyObject?)->(Void)))
    {
        
        completion(nil)
    }
}

class RemoteNotificationDeepLinkArticle : RemoteNotificationDeepLink
{
    var articleID : String!
    
    override init(articleStr: String)
    {
        self.articleID = articleStr
        super.init(articleStr: articleStr)
    }
    
    private override func triggerImp(completion: ((AnyObject?)->(Void)))
    {
        super.triggerImp()
            { (passedData) in
                
                var viewControlePage = UIViewController()
                
                // Handle Deep Link Data to present the Article passed through
                
                if self.articleID == "A"
                {
                    viewControlePage = MainTableViewController()
                }
                else if self.articleID == "B"
                {
//                    vc = ViewControllerB()s
                }
                else if self.articleID == "C"
                {
//                    vc = ViewControllerC()
                }
                
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.window?.addSubview(viewControlePage.view)
                
                completion(nil)
        }
    }
    
}
