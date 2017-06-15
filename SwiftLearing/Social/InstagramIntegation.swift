//
//  InstagramIntegation.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/14/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class InstagramIntegation: UIViewController {

    
    var webView: UIWebView! = nil
    @IBOutlet var tableView: UITableView!
    let instagramManager = NetworkManager.sharedInstance
    var user: InstagramUser? = nil

    
    let CLIENTID        : String = "8ac2aecd22324a24a6a388b11ccbee8a"
    let CLIENTSECRET    : String = "4120b309812c44119fdd25913c3334a0"
    
    let kBaseURL = "https://instagram.com/"
    let kInstagramAPIBaseURL = "https://api.instagram.com"
    let kAuthenticationURL = "oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token&scope=likes+comments+basic"  // comments
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
            let URL = "https://api.instagram.com/oauth/authorize/?client_id="+CLIENTID+"&redirect_uri=https://www.madebyfire.com/&response_type=code"
            print(URL)
            
            instagramManager.delegate = self as NetworkManagerDelegate
            //log out
//            deleteChache()
        
            initWebView()
            initTableView()
    }

    
    private func actionWhenUserLogedIn() {
        self.webView.isHidden = true
    }
    
    func deleteChache() {
        URLCache.shared.removeAllCachedResponses()
        if let cookies = HTTPCookieStorage.shared.cookies {
            for cookie in cookies {
                HTTPCookieStorage.shared.deleteCookie(cookie)
            }
        }
    }
}



// MARK: NetworkManagerDelegate

extension InstagramIntegation: NetworkManagerDelegate {
    
    func initNetworkManager() {
        instagramManager.delegate = self
    }
    
    func getAccessTokenDidEnd(accessToken: String?, error: NSError?) {
        instagramManager.loadProfile()
    }
    
    func loadProfileDidEnd(user: InstagramUser?, error: NSError?) {
        
        self.user = user
        
        DispatchQueue.main.async() {
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
}

// MARK: UIWebView

extension InstagramIntegation: UIWebViewDelegate {
    
    
    func initWebView() {
        
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        webView.delegate = self
        view.addSubview(webView)
        
        authorizationRequestInWebView()
    }
    
    private func authorizationRequestInWebView() {
        
        if let url = NSURL(string: instagramManager.authentificationUrl) {
            let request = URLRequest(url: url as URL, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 10.0)
            webView.loadRequest(request)
        }
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        let urlString = (request.url?.absoluteString)!
        
        if let range = urlString.range(of: instagramManager.redirectURI + "?code=") {
            
            let location = range.upperBound
            let code = urlString.substring(from: location)
            instagramManager.code = code
            NSLog("code: \(code)")
            instagramManager.getAccessToken()
            
//            actionWhenUserLogedIn()
            return false
        }
        
        return true
    }
}

// MARK: UITableView

extension InstagramIntegation: UITableViewDataSource, UITableViewDelegate {
    
    func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = true
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell")!
        
        if let profileTableViewCell = cell as? ProfileTableViewCell {
            if let user = self.user {
                profileTableViewCell.setData(user: user)
            }
        }
        
        return cell
    }
}
