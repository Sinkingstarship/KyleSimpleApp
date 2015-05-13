//
//  friendTableViewCell.swift
//  GithubFriends
//
//  Created by Kyle Brooks Robinson on 5/12/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class friendTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarViewBox: avatarView!
    
    @IBOutlet weak var reposButton: UIButton!
    @IBOutlet weak var gistsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        reposButton.layer.cornerRadius = 10
        reposButton.layer.borderWidth = 1
        reposButton.layer.borderColor = UIColor.blackColor().CGColor
        gistsButton.layer.cornerRadius = 10
        gistsButton.layer.borderWidth = 1
        gistsButton.layer.borderColor = UIColor.blackColor().CGColor

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
