//
//  RoundTwoDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/6.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundTwoDemoViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


@implementation RoundTwoDemoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
    contentScrollView.scrollEnabled = YES;
    [self.view addSubview:contentScrollView];
    
    UIImageView  *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [avatarImageView.layer setCornerRadius:50];
    [avatarImageView setImage:[UIImage imageNamed:@"avatar"]];
    avatarImageView.layer.shouldRasterize = YES;
    [contentScrollView addSubview:avatarImageView];
    
    
    NSString *imageUrl = @"http://t53-4.yunpan.360.cn/p2/800-600.1540425da8804644ac7fcae31ed0de69b5a33bc8_whjt_53_whjt3_t.993a0d.jpg?st=syWuhyPzwYT5ELjVEeCbDg&e=1454655430";
    
    //UIImageView加载网络图片光栅化
    UIImageView  *avatarImageViewUrl = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    [avatarImageViewUrl.layer setCornerRadius:50];
    [avatarImageViewUrl sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    avatarImageViewUrl.layer.shouldRasterize = YES;
    avatarImageViewUrl.layer.rasterizationScale=[UIScreen mainScreen].scale;  //不加这句会产生模糊
    [contentScrollView addSubview:avatarImageViewUrl];
    
    
    //UIButton 加载网络图片光栅化
    UIButton *avatarButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    avatarButton.clipsToBounds = YES;
    [avatarButton.layer setCornerRadius:50];
    [avatarButton sd_setImageWithURL:[NSURL URLWithString:imageUrl] forState:UIControlStateNormal];
    avatarButton.layer.shouldRasterize = YES;
    [contentScrollView addSubview:avatarButton];
}


@end
