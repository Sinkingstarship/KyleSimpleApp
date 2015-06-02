//
//  CharacterTableViewCell.h
//  GroupTherapy
//
//  Created by Kyle Brooks Robinson on 6/2/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CharacterTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *characterImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabelOutlet;
@property (weak, nonatomic) IBOutlet UILabel *comicIssueLabel;
@property (weak, nonatomic) IBOutlet UIView *circleView;



@end
