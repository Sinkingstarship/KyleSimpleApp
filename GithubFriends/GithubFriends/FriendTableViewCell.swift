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
    
    // This is an alternate way to do the labels.  Joe's Way:
    
    var friendIndex: Int!
    
    var friendInfo: [String:AnyObject?]! {
        
        didSet {
            
            reposButton.tag = friendIndex
            gistsButton.tag = friendIndex
            
            nameLabel.text = friendInfo["name"] as? String
            let repoCount = friendInfo["public_repos"] as! Int
            reposButton.setTitle("Repos \(repoCount)", forState: .Normal)
            
            let gistCount = friendInfo["public_gists"] as! Int
            gistsButton.setTitle("Gists \(gistCount)", forState: .Normal)
        
            let avatarURL = friendInfo["avatar_url"] as! String
            
            let url = NSURL(string: avatarURL)!
            
            let data = NSData(contentsOfURL: url)!
            
            let image = UIImage(data: data)
            
            avatarViewBox.image = image
            
            avatarViewBox.layer.cornerRadius = 20
            avatarViewBox.layer.masksToBounds = true
            
            
        }
    }
    
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
