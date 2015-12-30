//
//  MineTableViewCell.m
//  Picture
//
//  Created by SCJY on 15/12/30.
//  Copyright © 2015年 SCJY. All rights reserved.
//

#import "MineTableViewCell.h"
#define KWidth [UIScreen mainScreen].bounds.size.width
@interface MineTableViewCell ()
@property(nonatomic, retain) UILabel *lable2;
@property(nonatomic, retain) UILabel *lable1;
@property(nonatomic, retain) UIImageView *imageview;
@end

@implementation MineTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self load];
    }
    return self;
}

- (void)load{
    self.lable1 = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 10, 5, KWidth * 3 / 4 - 10, KWidth / 10)];
    self.lable1.text = @"你咋不上天呢";
    self.lable1.font = [UIFont systemFontOfSize:20];
    
    self.lable2 = [[UILabel alloc] initWithFrame:CGRectMake(KWidth / 4 + 10, KWidth / 10 + 5, KWidth * 3 / 4 - 10, KWidth / 10)];
    self.lable2.text = @"你咋不上称呢";
    self.lable2.font = [UIFont systemFontOfSize:15];
    self.lable2.textColor = [UIColor grayColor];
    
    self.imageview = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, KWidth / 4, KWidth / 5)];
    self.imageview.image = [UIImage imageNamed:@"10.jpg"];
    
    [self addSubview:self.lable2];
    [self addSubview:self.lable1];
    [self addSubview:self.imageview];
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
