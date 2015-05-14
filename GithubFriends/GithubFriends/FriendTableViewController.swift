//
//  FriendTableViewController.swift
//  GithubFriends
//
//  Created by Kyle Brooks Robinson on 5/12/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class FriendTableViewController: UITableViewController {
    

    
    var friends: [[String:AnyObject?]] = [
        
        [
            "login": "kylerobinson1988",
            "id": 12154801,
            "avatar_url": "https://avatars.githubusercontent.com/u/12154801?v=3",
            "gravatar_id": "",
            "url": "https://api.github.com/users/kylerobinson1988",
            "html_url": "https://github.com/kylerobinson1988",
            "followers_url": "https://api.github.com/users/kylerobinson1988/followers",
            "following_url": "https://api.github.com/users/kylerobinson1988/following{/other_user}",
            "gists_url": "https://api.github.com/users/kylerobinson1988/gists{/gist_id}",
            "starred_url": "https://api.github.com/users/kylerobinson1988/starred{/owner}{/repo}",
            "subscriptions_url": "https://api.github.com/users/kylerobinson1988/subscriptions",
            "organizations_url": "https://api.github.com/users/kylerobinson1988/orgs",
            "repos_url": "https://api.github.com/users/kylerobinson1988/repos",
            "events_url": "https://api.github.com/users/kylerobinson1988/events{/privacy}",
            "received_events_url": "https://api.github.com/users/kylerobinson1988/received_events",
            "type": "User",
            "site_admin": false,
            "name": "Kyle Robinson",
            "company": "",
            "blog": "",
            "location": "Atlanta, Georgia",
            "email": "",
            "hireable": false,
            "bio": nil,
            "public_repos": 1,
            "public_gists": 0,
            "followers": 8,
            "following": 8,
            "created_at": "2015-04-28T14:21:43Z",
            "updated_at": "2015-05-12T13:09:30Z"
        ]
    
    
    
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
      
        
    }
    
    

        
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return friends.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! friendTableViewCell
        
        // My way:
        
        if var repos = friends[indexPath.row]["public_repos"] as? Int {
                cell.reposButton.setTitle("Repos \(repos)", forState: UIControlState.Normal)
        }
        
        if var gists = friends[indexPath.row]["public_gists"] as? Int {
                cell.gistsButton.setTitle("Gists \(gists)", forState: UIControlState.Normal)
        }
        
        // My way
        
        
        cell.avatarViewBox.layer.cornerRadius = 10
        cell.avatarViewBox.layer.masksToBounds = true
        
        cell.nameLabel.text = friends[indexPath.row]["name"] as? String
        
        // Joe's way
        
        cell.friendIndex = indexPath.row
        cell.friendInfo = friends[indexPath.row]
        
        // Joe's Way
        
        
        if let url = NSURL(string: friends[indexPath.row]["avatar_url"] as! String) {
            let data = NSData(contentsOfURL: url)
            cell.avatarViewBox.image = UIImage(data: data!)
        }

        
        

        // Configure the cell...
        
        
        
        return cell

    }
    

//    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell as! friendTableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
//        
//
//        
//        cell.avatarViewBox.layer.cornerRadius = 10
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            friends.removeAtIndex(indexPath.row)
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "reposSegue" {

            // The below isn't force unwrapping it, the destination view controller is not an optional.
        
            var reposTVC = segue.destinationViewController as! ReposTableTableViewController
        
            var reposButton = sender as! UIButton
        
            reposTVC.friendInfo = friends[reposButton.tag]
    
        }
        
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    

}
