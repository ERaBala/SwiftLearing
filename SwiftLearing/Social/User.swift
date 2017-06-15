//
//  User.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/15/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class InstagramUser {

    var id: String?
    var userName: String?
    var fullName: String?
    var profilePicture: String?
    var bio: String?
    var website: String?
    var followsCount: Int?
    var followedByCount: Int?
    
    init(userDict:[String:AnyObject]) {
        
        self.id = userDict["id"] as? String
        self.userName = userDict["username"] as? String
        self.fullName = userDict["full_name"] as? String
        self.profilePicture = userDict["profile_picture"] as? String
        self.bio = userDict["bio"] as? String
        self.website = userDict["website"] as? String
        
        if let countsDict = userDict["counts"] as? [String: AnyObject] {
            self.followsCount = countsDict["follows"] as? Int
            self.followedByCount = countsDict["followed_by"] as? Int
        }
    }
    
    var description: String {
        get {
            var result = ""
            result += descriptionString(name: "id", value: id)
            result += descriptionString(name: "userName", value: userName)
            result += descriptionString(name: "fullName", value: fullName)
            result += descriptionString(name: "profilePicture", value: profilePicture)
            result += descriptionString(name: "bio", value: bio)
            result += descriptionString(name: "website", value: website)
            result += descriptionInt(name: "followsCount", value: followsCount)
            result += descriptionInt(name: "followedByCount", value: followedByCount)
            return result
        }
    }
    
    private func descriptionString(name: String, value: String?) -> String{
        var result = "\(name): "
        if let _value = value {
            result += _value
        } else {
            result += "nil"
        }
        return result + "\n"
    }
    
    private func descriptionInt(name: String, value: Int?) -> String{
        var result = "\(name): "
        if let _value = value {
            result += "\(_value)"
        } else {
            result += "nil"
        }
        return result + "\n"
    }
    
}
