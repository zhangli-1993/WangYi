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
@property(nonatomic, retain) UISegmentedControl *segmentedControl;

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
    for (int i = 0; i < 6; i++) {
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(0, 0, KWidth / 6, 40);
        [button1 setTitle:@"头条" forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(big:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button1];
    }

    
    
}

- (void)big:(UIButton *)btn{
     
}











- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
