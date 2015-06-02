//
//  ScratchDraw.m
//  ObjectDraw
//
//  Created by Kyle Brooks Robinson on 6/1/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import "ScratchView.h"

@implementation ScratchView


- (NSMutableArray * ) scratches {
    
    return _scratches;
    
}


- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    
    UIColor * color = [UIColor blackColor];
    [color set];
    
    for (NSValue * scratch in _scratches) {
        
        if (firstPoint = scratch.points.first) {
            
            strokeColor.set();
            CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
            
            for (point in scratch.points) {
                
                CGContextSetLineWidth(context, scratch.strokeSize);
                CGContextAddLineToPoint(context, point.x, point.y);
                
            }
            
            CGContextStrokePath(context);
            
        }
        
    }
    
}

- (void)newScratchWithStartPoint:(CGPoint)point {
    
    @property weak nonatomic Scratches * scratch;
    scratch.points = [point,point];
    
    scratch.strokeSize = 5.0
    scratch.strokeColor = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.0];
    
    [scratches append(scratch)];
    
    - (void)setNeedsDisplay;
    
    
}

- (void)updateCurrentScratchWithLastPoint:(CGPoint)point {
    
    if (scratches.lastObject != nil) {
        
        scratches@[scratches.count -1].points[1] = point;
        
        - (void)setNeedsDisplay;
    }
    
    
}


- (void)addPointToCurrentScratch:(CGPoint)point {
    
    if (scratches.count > 0) {
        
        scratches@[scratches.count -1].points.append(point);
        
        - (void)setNeedsDisplay;
        
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end



@interface Scratch

@property (nonatomic) CGPoint * points;
@property (nonatomic) UIColor * strokeColor;
@property (nonatomic) double strokeSize;

@end
