//
//  ViewController.m
//  ObjectDraw
//
//  Created by Kyle Brooks Robinson on 6/1/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

#import "ViewController.h"
#import "ScratchView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ScratchView * scratchPad;

@end

@implementation ViewController
{
    ScratchView * sView;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [_view addSubview:_scratchPad];
    
}


//override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//    
//    if let touch = touches.first as? UITouch {
//        
//        let location = touch.locationInView(scratchPad)
//        
//        scratchPad.newScratchWithStartPoint(location)
//        
//        println(scratchPad.scratches)
//        println(scratchPad.scratches.count)
//    }
//    
//}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * firstTouch = touches.allObjects.firstObject;
    CGPoint location = [firstTouch locationInView: self.view];
    
    sView = (ScratchView *)self.view;
    
    
    [sView.scratches addObject: [NSValue valueWithCGPoint:location]];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch * firstTouch = touches.allObjects.firstObject;
    CGPoint location = [firstTouch locationInView: self.view];
    
    [sView.scratches addObject: [NSValue valueWithCGPoint:location]];
    
    [self.view setNeedsDisplay];
}





@end
