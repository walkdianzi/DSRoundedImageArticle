//
//  RoundSixDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/7.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundSixDemoViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

@implementation RoundSixDemoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    CGRect viewBounds = self.view.bounds;
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, viewBounds.size.width, viewBounds.size.height)];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
    contentScrollView.scrollEnabled = YES;
    [self.view addSubview:contentScrollView];
    
    
    
    /*------------------网络图片，在图片完成加载的时候绘制圆角-----------------------*/
    NSString *imageUrl = @"http://t53-4.yunpan.360.cn/p2/800-600.1540425da8804644ac7fcae31ed0de69b5a33bc8_whjt_53_whjt3_t.993a0d.jpg?st=syWuhyPzwYT5ELjVEeCbDg&e=1454655430";
    
    
    //封装到SDWebImage
    
    for(int i = 0; i < 200; i++){
        
        int cell = i%7;
        int row = i/7;
        UIImageView  *avatarImageViewUrl2 = [[UIImageView alloc] initWithFrame:CGRectMake(cell*55, row*55, 50, 50)];
        [avatarImageViewUrl2 sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"avatar"]  options:0 isClipRound:YES progress:nil completed:nil];
        [contentScrollView addSubview:avatarImageViewUrl2];
    }
}

@end
