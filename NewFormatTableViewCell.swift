//
//  NewFormatTableViewCell.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 05/01/16.
//  Copyright © 2016 CAPS. All rights reserved.
//

import UIKit

class NewFormatTableViewCell: UITableViewCell {

    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var qualification: UILabel!
    @IBOutlet weak var tecaherName: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.blackColor().CGColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
