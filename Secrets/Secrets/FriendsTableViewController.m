//
//  FriendsTableViewController.m
//  Secrets
//
//  Created by Kyle Brooks Robinson on 6/15/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import "FriendsTableViewController.h"

#import <Parse/Parse.h>
#import <Bolts/Bolts.h>

@interface FriendsTableViewController ()

@end

@implementation FriendsTableViewController
{
    NSArray * friends;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    PFQuery * query = [PFUser query];
    
    [query whereKey:@"objectID" notEqualTo:[PFUser currentUser].objectId];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray * objects, NSError * error) {
        
        if (objects.count > 1) {
            
            friends = objects;
            
        }
        
        [self.tableView reloadData];
        
        
    }];
    
    
    
    
    
    }

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PFUser * user = friends[indexPath.row];
    
    PFQuery * deviceQuery = [PFInstallation query];
    [deviceQuery whereKey:@"user" equalTo:user];
    
    PFPush * push = [PFPush push];
    
    [push setMessage:[NSString stringWithFormat:@"%@ has Poked you", [PFUser currentUser].username]];
    [push setQuery:deviceQuery];
    
    [push sendPushInBackground];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return friends.count;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    NSLog(@"%@", friends);
    
    return friends.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"friendCell" forIndexPath:indexPath];
    
    PFUser * user = friends[indexPath.row];
    
    cell.textLabel.text = user.username;
    
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
