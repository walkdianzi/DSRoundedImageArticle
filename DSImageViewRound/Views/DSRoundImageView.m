//
//  DSRoundImageView.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/8.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "DSRoundImageView.h"

@interface DSRoundImageView(){
    
    NSInvocationOperation *operation;
    NSOperationQueue *queue;
    UIImage *circleImage;
}

@end

@implementation DSRoundImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        queue = [[NSOperationQueue alloc] init];
    }
    return self;
}


- (void)setImage:(UIImage *)image {
    [super setImage:image];
    //return;
    [super setImage:nil];
    [self roundedImage:image];
}

- (void)roundedImage:(UIImage *)image {
    //创建操作对象，封装要执行的任务
    [queue cancelAllOperations];
    [operation cancel];
    operation = nil;
    operation=[[NSInvocationOperation alloc]initWithTarget:self selector:@selector(setCircleImage:) object:image];
    [queue addOperation:operation];
}

- (void)setCircleImage:(UIImage *)image {
    // Begin a new image that will be the new image with the rounded corners
    // (here with the size of an UIImageView)
    //    UIGraphicsBeginImageContext(self.bounds.size);
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, [UIScreen mainScreen].scale);
    // Add a clip before drawing anything, in the shape of an rounded rect
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds
                                cornerRadius:self.bounds.size.height/2] addClip];
    // Draw your image
    [image drawInRect:self.bounds];
    
    // Get the image, here setting the UIImageView image
    circleImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // Lets forget about that we were drawing
    UIGraphicsEndImageContext();
    if (!operation) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [super setImage:circleImage];
        
    });
    
}
@end
