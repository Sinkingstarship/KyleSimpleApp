//
//  GameScene.h
//  PixelAdventure
//

//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameScene : SKScene

- (void)changePixelDirection:(CGFloat)direction;
- (void)movePixelInDirection:(CGVector)direction;

- (void)normalAttack;
-(void)specialAttack;


@end
