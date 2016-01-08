//
//  RoundNineDemoViewController.m
//  DSImageViewRound
//
//  Created by dasheng on 16/1/8.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "RoundNineDemoViewController.h"
#import "DSRoundImageView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

#define kHeight 40

@interface RoundNineDemoViewController()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *imageArr;

@end

@implementation RoundNineDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 500;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    NSInteger total = CGRectGetWidth(self.view.frame)/kHeight;
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        for (int i=1; i<=total; i++) {
            DSRoundImageView *imageView = [[DSRoundImageView alloc]initWithFrame:CGRectMake(kHeight * (i-1), 2, kHeight, kHeight)];
            imageView.tag = i;
            [cell.contentView addSubview:imageView];
        }
        
    }
    for (int i=1; i<=total; i++) {
        DSRoundImageView *imageView = [cell viewWithTag:i];
        NSURL *url = [NSURL URLWithString:[self urlStr:indexPath.row]];
        [imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            
            imageView.image = image;
        }];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kHeight+4;
}

- (NSString *)urlStr:(NSInteger)row {
    NSInteger count = self.imageArr.count;
    NSInteger index = arc4random() % count;
    return [self.imageArr objectAtIndex:index];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height - 64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
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
                      @"http://pic.meizitu.com/wp-content/uploads/2015a/11/20/10.jpg"];
    }
    return _imageArr;
}

@end
