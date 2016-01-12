//
//  RoundTenDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/12.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundTenDemoViewController.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "UIImage+DSRoundImage.h"

@implementation RoundTenDemoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
    contentScrollView.scrollEnabled = YES;
    [self.view addSubview:contentScrollView];
    
    /*加入UIImage+DSRoundImage.h
      修改SDWebImage代码，标准//!!!: 绘制圆角  的地方是新加的代码
     */
    
    NSString *imageUrl = @"http://t53-4.yunpan.360.cn/p2/800-600.1540425da8804644ac7fcae31ed0de69b5a33bc8_whjt_53_whjt3_t.993a0d.jpg?st=syWuhyPzwYT5ELjVEeCbDg&e=1454655430";
    
    
    UIImageView  *avatarImageViewUrl = [[UIImageView alloc] initWithFrame:CGRectMake(100, 250, 100, 100)];
    [avatarImageViewUrl setIsRound:YES withSize:CGSizeMake(100, 100)];
    [avatarImageViewUrl sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    [contentScrollView addSubview:avatarImageViewUrl];
    
    
    UIImageView  *avatarImageViewUrl2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    [avatarImageViewUrl2 setIsRound:NO withSize:CGSizeMake(100, 100)];
    [avatarImageViewUrl2 sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
    [contentScrollView addSubview:avatarImageViewUrl2];
}
@end
