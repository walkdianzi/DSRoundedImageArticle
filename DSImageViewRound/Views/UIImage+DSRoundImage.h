//
//  UIImage+DSRoundImage.h
//  DSImageViewRound
//
//  Created by dasheng on 16/1/12.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import <UIKit/UIKit.h>

static const NSString *DSRoundImagePreString = @"DSIsRound";

@interface UIImage (DSRoundImage)

/**
 *  主要SDWebImage里使用，key会缓存key
 *
 *  @param image 原始图片
 *  @param key   缓存key
 *
 *  @return 圆角图片
 */
+ (id)createRoundedRectImage:(UIImage*)image withKey:(NSString *)key;


+ (id)createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(int)radius;

@end
