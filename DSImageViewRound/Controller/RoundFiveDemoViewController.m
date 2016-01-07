//
//  RoundFiveDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/7.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundFiveDemoViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"


@implementation RoundFiveDemoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    CGRect viewBounds = self.view.bounds;
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, viewBounds.size.width, viewBounds.size.height)];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 2000);
    contentScrollView.scrollEnabled = YES;
    [self.view addSubview:contentScrollView];
    
    
    NSString *imageUrl = @"http://t53-4.yunpan.360.cn/p2/800-600.1540425da8804644ac7fcae31ed0de69b5a33bc8_whjt_53_whjt3_t.993a0d.jpg?st=syWuhyPzwYT5ELjVEeCbDg&e=1454655430";
    
    
    for(int i = 0; i < 200; i++){
        
        int cell = i%7;
        int row = i/7;
        
        //UIImageView ios9.0之前设置圆角是会产生离屏渲染的，9.0之后不会产生离屏渲染
        UIImageView  *avatarImageViewUrl = [[UIImageView alloc] initWithFrame:CGRectMake(cell*55, row*55, 50, 50)];
        avatarImageViewUrl.clipsToBounds = YES;
        [avatarImageViewUrl.layer setCornerRadius:25];
        [avatarImageViewUrl sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"avatar"]];
        [contentScrollView addSubview:avatarImageViewUrl];
    }
}

@end
