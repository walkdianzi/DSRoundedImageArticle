//
//  RootViewController.m
//  DSCategories
//
//  Created by dasheng on 15/12/17.
//  Copyright © 2015年 dasheng. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"圆角";
    _items = @{
               @"Test":@[
                       @"RoundFive",
                       @"RoundSix",
                       @"RoundSeven",
                       @"RoundEight",
                       @"RoundNine",
                       @"RoundEleven"
                       ],
               @"ImageViewRound":@[
                            @"RoundOne",
                            @"RoundTwo",
                            @"RoundThree",
                            @"RoundFour",
                            @"RoundTen"
                        ]
             };
    
    _itemsName = @{
               
                   @"Test":@[
                           @"setCornerRadius测试",
                           @"ScrollView drawInRect测试(主线程)",   //UIScrollView  图片圆角主线程绘制，阻塞了主线程，进入页面有点慢（内存280M左右）
                           @"ScrollView drawInRect测试(后台线程)", //UIScrollView  图片圆角后台线程绘制，内存占用超过1G很容易崩溃(第一次就点击这个内存超过1G，如果先点击上面一个再点击这个内存250M左右)
                           @"TableView drawInRect测试(主线程)",  //TableView  图片圆角主线程绘制，滚动的时候有卡顿(内存250M左右)
                           @"TableView drawInRect测试(后台线程)", //TableView  图片圆角后台线程绘制，内存占用没有超过1G的没崩溃(内存250M左右)
                           @"SDWebImage处理图片时绘制圆角测试"
                           ],
                   
                   @"ImageViewRound":@[
                           @"setCornerRadius最简单的设置圆角",
                           @"setCornerRadius设置圆角后光栅化",
                           @"图片覆盖设置圆角",
                           @"UIImage drawInRect绘制圆角",
                           @"SDWebImage处理图片时绘制圆角(最好)"
                           ],
               };
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView reloadData];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[_items allKeys] count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [_items allKeys][section];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_items objectForKey:[_items allKeys][section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text =  [_itemsName objectForKey:[_itemsName allKeys][indexPath.section]][indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name =  [_items objectForKey:[_items allKeys][indexPath.section]][indexPath.row];
    NSString *className = [name stringByAppendingString:@"DemoViewController"];
    Class class = NSClassFromString(className);
    UIViewController *controller = [[class alloc] init];
    controller.title = name;
    [self.navigationController pushViewController:controller animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
