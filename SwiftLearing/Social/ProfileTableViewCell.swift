//
//  ProfileTableViewCell.swift
//  SwiftLearing
//
//  Created by Bala-MAC on 6/15/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var fullNameLabel: UILabel!
    @IBOutlet var profilePictureLabel: UILabel!
    @IBOutlet var bioLabel: UILabel!
    @IBOutlet var websiteLabel: UILabel!
    @IBOutlet var followsCountLabel: UILabel!
    @IBOutlet var followedByCountLabel: UILabel!
    
    func setData(user: InstagramUser) {
        
        
        print("id = \(String(describing: user.id)), /n fullName = \(String(describing: user.fullName)) /n username = \(String(describing: user.userName))")
        
        setLabel(label: idLabel, value: user.id)
        setLabel(label: userNameLabel, value: user.userName)
        setLabel(label: fullNameLabel, value: user.fullName)
        setLabel(label: websiteLabel, value: user.website)

        setLabel(label: followsCountLabel, value: user.followsCount)
        setLabel(label: followedByCountLabel, value: user.followedByCount)
        
//        setLabel(profilePictureLabel, value: user.profilePicture)
//        setLabel(bioLabel, value: user.bio)
        
    }
    
    private func setLabel(label: UILabel, value: String?) {
        if let _value = value {
            label.text = _value
        } else {
            label.text = "-"
        }
    }
    
    private func setLabel(label: UILabel, value: Int?) {
        if let _value = value {
            label.text = "\(_value)"
        } else {
            label.text = "-"
        }
    }
}
