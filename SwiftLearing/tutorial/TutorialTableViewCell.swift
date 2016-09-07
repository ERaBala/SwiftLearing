//
//  TutorialTableViewCell.swift
//  SwiftLearing
//
//  Created by Bala on 07/09/16.
//  Copyright © 2016 user. All rights reserved.
//

import UIKit

class TutorialTableViewCell: UITableViewCell {

    @IBOutlet weak var StepLabel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DescriptionTxtView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
