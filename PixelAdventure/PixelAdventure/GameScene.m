//
//  GameScene.m
//  PixelAdventure
//
//  Created by Kyle Brooks Robinson on 6/8/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene
{
    SKSpriteNode * pixel;
    CGFloat characterDirection;
}

-(void)didMoveToView:(SKView *)view {
    
//    NSLog(@"%f, %f", view.frame.size.width, view.frame.size.height);
    
    self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:view.frame];
    
    pixel = [SKSpriteNode spriteNodeWithImageNamed:@"slime"];
    
//    pixel.fillColor = [UIColor cyanColor];
//    pixel.strokeColor = [UIColor clearColor];
    
    pixel.position = CGPointMake(100, 10);
    
    pixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:18];
    pixel.physicsBody.friction = 2;
    
    [self addChild:pixel];
    
}

- (void)changePixelDirection:(CGFloat)direction {
    
    characterDirection = direction;
    
}



- (void)movePixelInDirection:(CGVector)direction {
    
    [pixel.physicsBody applyImpulse:direction];
    [pixel.physicsBody applyForce:direction];
    
    CGFloat newX = pixel.position.x + direction.dx;
    CGFloat newY = pixel.position.y + direction.dy;
    
    pixel.position = CGPointMake(newX, newY);
    
}

- (void)normalAttack {
    
    SKAction * soundEffect = [SKAction playSoundFileNamed:@"fireball.wav" waitForCompletion:NO];
    
    [self runAction:soundEffect];
    
    SKShapeNode * babyPixel = [SKShapeNode shapeNodeWithEllipseOfSize:CGSizeMake(10, 10)];
    babyPixel.fillColor = [UIColor magentaColor];
    babyPixel.strokeColor = [UIColor clearColor];
    
    babyPixel.position = CGPointMake(pixel.position.x +10, pixel.position.y);
    
    [self addChild:babyPixel];
    
    babyPixel.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
    babyPixel.physicsBody.affectedByGravity = NO;
    
    [babyPixel.physicsBody applyImpulse:CGVectorMake(0.1, 0)];
    
    
}

-(void)specialAttack {
    
    SKAction * soundEffect = [SKAction playSoundFileNamed:@"fire.wav" waitForCompletion:NO];
    
    [self runAction:soundEffect];

    
    SKEmitterNode * fireBall = [SKEmitterNode nodeWithFileNamed:@"Attack"];
    
    fireBall.position = CGPointMake(pixel.position.x +10, pixel.position.y);
    
    [self addChild:fireBall];
    
    fireBall.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:1];
//    fireBall.physicsBody.affectedByGravity = NO;
    
    [fireBall.physicsBody applyImpulse:CGVectorMake(0.1, 0.1)];
    
    
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch * touch in touches) {
        
        CGPoint location = [touch locationInNode:self];
        
        
    }
    
}

-(void)update:(CFTimeInterval)currentTime {

    pixel.position = CGPointMake(pixel.position.x + characterDirection, pixel.position.y);

}

@end
