//
//  NetworkManager.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/15/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

protocol NetworkManagerDelegate {
    func getAccessTokenDidEnd(accessToken: String?, error: NSError?)
    func loadProfileDidEnd(user: InstagramUser?, error: NSError?)
}

class NetworkManager: NSObject {

    var delegate: NetworkManagerDelegate?
    var accessToken: String? = nil
    var code: String? = nil
    
    let baseURLString = "https://api.instagram.com"
    let clientID = "8ac2aecd22324a24a6a388b11ccbee8a"
    let redirectURI = "http://fiternity.co"
    let clientSecret = "4120b309812c44119fdd25913c3334a0"
    
    static let InstagramResponseError = "InstagramResponseError"
}

// MARK: Get/Set

extension NetworkManager {
    
    var authentificationUrl: String {
        get {
            return "\(baseURLString)/oauth/authorize/?client_id=\(clientID)&redirect_uri=\(redirectURI)&response_type=code"
        }
    }
    
    class var sharedInstance: NetworkManager {
        
        let _: NetworkManager = { NetworkManager() }()

        struct Static {
            static var instance: NetworkManager? = nil
        }
            Static.instance = NetworkManager()
        
        return Static.instance!
    }
}


// MARK: Errors

extension NetworkManager {
    
    func fetchError(jsonDataDict: [String: AnyObject]) -> NSError? {
        
        var error: NSError? = nil
        
        if let meta = jsonDataDict["meta"] as? [String:AnyObject] {
            
            if let code = meta["code"] as? Int {
                
                switch code {
                    
                case 400:
                    error = NSError(domain: NetworkManager.InstagramResponseError, code: code, userInfo: meta)
                    
                default:
                    break
                }
            }
        }
        return error
    }
}

// MARK: Load Data

extension NetworkManager {
    
    func newRequest(url: String, HTTPMethod: String, paramString: String?, completionHandler: @escaping ([String: AnyObject]?, URLResponse?, NSError?) -> Void) {
        
        if let url =  NSURL(string:url) {
            
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = HTTPMethod
            if let paramString = paramString {
                request.httpBody = paramString.data(using: String.Encoding.utf8)!
            }
            
            let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
                
                do {
                    var json: [String: AnyObject]? = nil
                    var responseError: NSError? = error! as NSError
                    
                    if let jsonData = data {
                        if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                            if let _responseError = self.fetchError(jsonDataDict: jsonDataDict) {
                                responseError = _responseError
                            }
                            
                            json = jsonDataDict
                        }
                    }
                    
                    completionHandler(json, response, responseError)
                    
                } catch let err as NSError {
                    print(err.debugDescription)
                }
            }
            
            task.resume()
        }
    }
    
    func getAccessToken() {
        
        if let code = self.code {
            
            let urlString = "\(baseURLString)/oauth/access_token"
            let paramString  = "client_id=\(clientID)&client_secret=\(clientSecret)&grant_type=authorization_code&redirect_uri=\(redirectURI)&code=\(code)&scope=basic+public_content"
            
            newRequest(url: urlString, HTTPMethod: "POST", paramString: paramString) { (json, response, error) in
                
                if let json = json {
                    if let access_token = json["access_token"] as? String {
                        self.accessToken = access_token
                        print("access_token: \(access_token)")
                    } else {
                        self.accessToken = nil
                    }
                }
                if let delegate = self.delegate {
                    delegate.getAccessTokenDidEnd(accessToken: self.accessToken, error: error)
                }
            }
        }
        
    }
    
    func loadProfile() {
        
        if let accessToken = self.accessToken {
            
            let urlString = "https://api.instagram.com/v1/users/self/?access_token=\(accessToken)"
            
            newRequest(url: urlString, HTTPMethod: "GET", paramString: nil) { (json, response, error) in
                
                var user: InstagramUser? = nil
                
                if let json = json {
                    if let userData = json["data"] as? [String:AnyObject] {
                        user = InstagramUser(userDict: userData)
                    }
                }
                
                if let delegate = self.delegate {
                    delegate.loadProfileDidEnd(user: user, error: error)
                }
            }
        }
    }
}
