//
//  OneViewController.m
//  WangYi
//
//  Created by scjy on 15/12/30.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "OneViewController.h"
#import "OneTableViewCell.h"
#import "TwoTableViewCell.h"
#import "ThreeTableViewCell.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height
@interface OneViewController ()
@property(nonatomic, retain) UITableView *tableView;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"网易";
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:195 / 256.0f green:0 / 256.0f blue:17 / 256.0f alpha:1.0];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        static NSString *str = @"123";
        OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[OneTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
        }
        return cell;
    } if (indexPath.row == 0) {
        static NSString *str1 = @"456";
        TwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str1];
        if (cell == nil) {
            cell = [[TwoTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str1];
        }
        return cell;
    }
    static NSString *str2 = @"789";
    ThreeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str2];
    if (cell == nil) {
        cell = [[ThreeTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str2];
    }
    return cell;
    
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1) {
        return KWidth / 2;
    }
    if (indexPath.row == 0) {
        return 40;
    }
    return KWidth / 5 + 10;
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
