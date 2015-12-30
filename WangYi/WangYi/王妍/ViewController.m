//
//  ViewController.m
//  Picture
//
//  Created by SCJY on 15/12/30.
//  Copyright © 2015年 SCJY. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"
#import "ScrollView.h"
#import "ButtonScrollView.h"
#import "MineTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
@interface ViewController ()<SDCycleScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, retain) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"网易";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:211 / 256.0f green:43 / 256.0f blue:54 / 256.0f alpha:1.0];
    self.navigationController.navigationBar.translucent = NO;
//    NSArray *images = @[[UIImage imageNamed:@"10.jpg"],
//                        [UIImage imageNamed:@"21.jpg"],
//                        [UIImage imageNamed:@"22.jpg"],
//                        [UIImage imageNamed:@"23.jpg"],
//                        [UIImage imageNamed:@"24.jpg"],
//                        [UIImage imageNamed:@"25.jpg"],
//                        [UIImage imageNamed:@"26.jpg"],
//                        
//                        ];
//    NSArray *title = @[@"流光容易把人抛", @"红了樱桃，绿了芭蕉", @"一蓑烟雨任平生", @"暮霭沉沉楚天阔", @"一川烟草，满城飞絮", @"今已亭亭如盖矣", @"绿蚁新醅酒，红泥小火炉"];
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 50, kWidth, kWidth * 0.6) imagesGroup: images];
//    cycleScrollView.titlesGroup = title;
//    cycleScrollView.backgroundColor = [UIColor cyanColor];
//    cycleScrollView.infiniteLoop = YES;
//    cycleScrollView.delegate = self;
//    cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
//    cycleScrollView.autoScrollTimeInterval = 3.0;
//    [self.view addSubview:cycleScrollView];
    
    //图片滑动
    ScrollView *scrollView = [[ScrollView alloc]initWithFrame:CGRectMake(0, 44, kWidth, kWidth * 0.6)];
    [self.view addSubview:scrollView];
    //标题滑动
    ButtonScrollView *buttonScroll = [[ButtonScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth - 44, 44)];
    [self.view addSubview:buttonScroll];
    
    //标题旁边的按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(kWidth - 44, 0, 44, 44);
    [button setBackgroundImage:[UIImage imageNamed:@"28-star.png"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 44 + kWidth * 0.6, kWidth, self.view.frame.size.height - 44 - kWidth * 0.6)];
    self.tableView.rowHeight = 100;
    self.tableView.separatorColor = [UIColor grayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str = @"123";
    MineTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    return cell;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
