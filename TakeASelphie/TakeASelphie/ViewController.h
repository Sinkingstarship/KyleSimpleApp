//
//  ViewController.h
//  TakeASelphie
//
//  Created by Kyle Brooks Robinson on 6/3/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) UIImage * original;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIImageView *unfilteredImageView;

@end

