//
//  ButtonScrollView.m
//  Picture
//
//  Created by SCJY on 15/12/30.
//  Copyright © 2015年 SCJY. All rights reserved.
//

#import "ButtonScrollView.h"
#define kWidth self.frame.size.width
#define kHeight self.frame.size.height

@interface ButtonScrollView()
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) UIButton *button;
@end


@implementation ButtonScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loading];
    }
    return self;
}
- (void)loading{
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    self.scrollView.contentSize = CGSizeMake(kWidth * 2, kHeight);
    NSArray *title = @[@"头条", @"娱乐", @"热点", @"体育", @"洛阳", @"财经", @"科技", @"图片", @"跟帖", @"汽车"];
    
    for (int i = 0; i < 10; i++) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.frame = CGRectMake(kWidth / 5 * i, 0, kWidth / 5, kHeight);
        [self.button setTitle:title[i] forState:UIControlStateNormal];
        self.button.tag = 110;
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button addTarget:self action:@selector(changeBig:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:self.button];
    }
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
}
- (void)changeBig:(UIButton *)button{
    button.titleLabel.font = [UIFont systemFontOfSize:28.0];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    UIButton *button = (UIButton *)[scrollView viewWithTag:110];
    return button;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
