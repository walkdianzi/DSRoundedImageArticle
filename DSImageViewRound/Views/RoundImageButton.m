//
//  RoundImageButton.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/6.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundImageButton.h"

@implementation RoundImageButton

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *_cornerCoverImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_cornerCoverImage setImage:[UIImage imageNamed:@"app_imageCornerCover"]];
        [self addSubview:_cornerCoverImage];
    }
    return self;
}


@end
