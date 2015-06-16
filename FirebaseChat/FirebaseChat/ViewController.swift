//
//  ViewController.swift
//  FirebaseChat
//
//  Created by Kyle Brooks Robinson on 6/15/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var chatField: UITextField!
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var messageTableView: UITableView!
    
    var myName: String?
    var myFirebase = Firebase(url:"secret-room.firebaseio.com")
    var chatMessages: [String:[String:AnyObject]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.dataSource = self
        messageTableView.delegate = self
        
        myFirebase.observeEventType(.Value, withBlock: {
            
            snapshot in
            
            if let data = snapshot.value as? [String:AnyObject] {
                
                    self.chatMessages = data["messages"] as! [String:[String:AnyObject]]
                
                    self.messageTableView.reloadData()
                
            }
        
        })
        
    }
    
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages.values.array.count
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("messageCell") as! UITableViewCell
        
        let message = chatMessages.values.array[indexPath.row]
        
        cell.textLabel?.text = message["name"] as? String
        cell.detailTextLabel?.text = message["message"] as? String
        
        return cell
        
    }
    

    
    @IBAction func saveName(sender: AnyObject) {
        
        myName = chatField.text
        
        chatField.text = ""
        
        self.nameButton.hidden = true
        self.messageButton.hidden = true


        
    }
    
    @IBAction func sendMessage(sender: AnyObject) {
        
        let firebaseMessages = myFirebase.childByAppendingPath("messages")
        
        let firebaseMessage = firebaseMessages.childByAutoId()
        
        let message = [
            
            "message": chatField.text,
            "name": myName
        
        ]
        
        chatField.text = ""
        
        
        firebaseMessage.setValue(message)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

