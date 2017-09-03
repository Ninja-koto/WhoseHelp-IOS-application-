//
//  FilterTableViewCell.swift
//  WhoseHelp_git1
//
//  Created by Saahil Chhabria on 25/01/16.
//  Copyright © 2016 CAPS. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet var distance: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var qualification: UILabel!
    @IBOutlet var teacherName: UILabel!
    @IBOutlet var rate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.borderWidth = 1
        profileImage.layer.masksToBounds = false
        profileImage.layer.borderColor = UIColor.blackColor().CGColor
        profileImage.layer.cornerRadius = profileImage.frame.height/2
        profileImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
