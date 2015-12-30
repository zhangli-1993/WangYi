//
//  TwoTableViewCell.m
//  WangYi
//
//  Created by scjy on 15/12/30.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "TwoTableViewCell.h"
#define KWidth [UIScreen mainScreen].bounds.size.width

@interface TwoTableViewCell()
@property(nonatomic, retain) UIScrollView *scrollView;
@end
@implementation TwoTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self load];
        
    }
    return self;
}

- (void)load{
//    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"头条", @"健康", @"科技", @"汽车", @"旅游", @"订阅"]];
//    self.segmentedControl.frame = CGRectMake(0, 0, KWidth, 40);
//    self.segmentedControl.tintColor = [UIColor whiteColor];
//    [self addSubview:self.segmentedControl];
    NSArray *title = @[@"头条", @"娱乐", @"热点", @"体育", @"洛阳", @"财经", @"科技", @"图片", @"跟帖", @"汽车"];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KWidth, 40)];
    self.scrollView.contentSize = CGSizeMake(KWidth * 2, 40);
    for (int i = 0; i < 10; i++) {
        UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:CGRectMake(KWidth / 5 * i, 0, KWidth / 5, 40)];
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.tag = 123;
        button1.frame = CGRectMake(0, 0, KWidth / 6, 40);
        [button1 setTitle:title[i] forState:UIControlStateNormal];
        [button1 setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [button1 addTarget:self action:@selector(big:) forControlEvents:UIControlEventTouchUpInside];
        
        [scroll addSubview:button1];
        [self.scrollView addSubview:scroll];
    }
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
}

- (void)big:(UIButton *)btn{
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    UIButton *zoom = [(UIButton *)scrollView viewWithTag:123];
    return zoom;
}










- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
