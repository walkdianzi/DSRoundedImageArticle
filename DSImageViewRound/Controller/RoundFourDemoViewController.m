//
//  RoundFourDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/6.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundFourDemoViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "DSRoundImageView.h"

@implementation RoundFourDemoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
    contentScrollView.scrollEnabled = YES;
    [self.view addSubview:contentScrollView];
    
    
    UIImage *image = [UIImage imageNamed:@"avatar"];
    UIImageView  *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [avatarImageView setImage:image];
    
    //绘制圆角，要在得到image的时候执行
    UIGraphicsBeginImageContextWithOptions(avatarImageView.bounds.size, NO, [UIScreen mainScreen].scale);
    [[UIBezierPath bezierPathWithRoundedRect:avatarImageView.bounds
                                cornerRadius:50] addClip];
    [image drawInRect:avatarImageView.bounds];
    avatarImageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [contentScrollView addSubview:avatarImageView];
    
    
    //!!!: 这种方式不合适有问题，内存会暴增
    /*------------------网络图片，在图片完成加载的时候绘制圆角-----------------------*/
    
    NSString *imageUrl = @"http://t53-4.yunpan.360.cn/p2/800-600.1540425da8804644ac7fcae31ed0de69b5a33bc8_whjt_53_whjt3_t.993a0d.jpg?st=syWuhyPzwYT5ELjVEeCbDg&e=1454655430";
    

    UIImageView  *avatarImageViewUrl = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    //在回调函数里绘制
    [avatarImageViewUrl sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"avatar"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        UIGraphicsBeginImageContextWithOptions(avatarImageViewUrl.bounds.size, NO, [UIScreen mainScreen].scale);
        [[UIBezierPath bezierPathWithRoundedRect:avatarImageViewUrl.bounds
                                    cornerRadius:50] addClip];
        [image drawInRect:avatarImageViewUrl.bounds];
        avatarImageViewUrl.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }];
    [contentScrollView addSubview:avatarImageViewUrl];
    
    
    //封装到UIImageView里
    DSRoundImageView  *avatarImageViewUrl2 = [[DSRoundImageView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    [avatarImageViewUrl2 sd_setImageWithURL:[NSURL URLWithString:imageUrl] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        avatarImageViewUrl2.image = image;
    }];
    [contentScrollView addSubview:avatarImageViewUrl2];
}

@end
