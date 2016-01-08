//
//  RoundSevenDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/8.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundSevenDemoViewController.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "DSRoundImageView.h"

@interface RoundSevenDemoViewController()

@property (nonatomic, strong) NSArray *imageArr;

@end

@implementation RoundSevenDemoViewController

- (void)viewDidLoad{
    
    [super viewDidLoad];
    
    CGRect viewBounds = self.view.bounds;
    UIScrollView *contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, viewBounds.size.width, viewBounds.size.height)];
    contentScrollView.contentSize = CGSizeMake(self.view.frame.size.width, 4000);
    contentScrollView.scrollEnabled = YES;
    [self.view addSubview:contentScrollView];
    
    
    
    /*------------------网络图片，在图片完成加载的时候绘制圆角-----------------------*/
    
    //封装到DSRoundImageView
    for(int i = 0; i < 500; i++){
        
        int cell = i%7;
        int row = i/7;
        DSRoundImageView  *avatarImageViewUrl2 = [[DSRoundImageView alloc] initWithFrame:CGRectMake(cell*55, row*55, 50, 50)];
        [avatarImageViewUrl2 sd_setImageWithURL:[NSURL URLWithString:[self urlStr:i]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            avatarImageViewUrl2.image = image;
        }];
        [contentScrollView addSubview:avatarImageViewUrl2];
    }
}


- (NSString *)urlStr:(NSInteger)row {
    NSInteger count = self.imageArr.count;
    NSInteger index = arc4random() % count;
    return [self.imageArr objectAtIndex:index];
}

- (NSArray *)imageArr {
    if (!_imageArr) {
        _imageArr = @[@"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/09.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/11/10.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/12/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/13/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/14/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/14/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/14/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/14/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/14/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/14/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/15/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/16/09.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/17/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/18/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/19/09.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/01.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/02.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/03.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/04.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/05.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/06.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/07.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/08.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/09.jpg",
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/10.jpg",
                      @"http://t53-4.yunpan.360.cn/p2/800-600.1540425da8804644ac7fcae31ed0de69b5a33bc8_whjt_53_whjt3_t.993a0d.jpg?st=syWuhyPzwYT5ELjVEeCbDg&e=1454655430"];
    }
    return _imageArr;
}

@end
