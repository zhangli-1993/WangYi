//
//  ScrollView.m
//  Picture
//
//  Created by SCJY on 15/12/30.
//  Copyright © 2015年 SCJY. All rights reserved.
//

#import "ScrollView.h"
#define kWidth self.frame.size.width
#define kHeight self.frame.size.height


@interface ScrollView()
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) UIPageControl *pageControl;
@property(nonatomic, retain) NSTimer *timer;
@end



@implementation ScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loading];
    }
    return self;
}
- (void)loading{
    self.backgroundColor = [UIColor blackColor];
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.contentSize = CGSizeMake(kWidth * 6, kHeight);
    for (int i = 0; i < 6; i ++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg", i + 21]];
        imageView.tag = 110;
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * i, 0, kWidth, kHeight)];
        [scroll addSubview:imageView];
        scroll.delegate = self;
        [self.scrollView addSubview:scroll];
    }
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kHeight - 30, kWidth, 30)];
    self.pageControl.numberOfPages = 6;
    [self addSubview:self.pageControl];
    [self addTime];
   
  
    
    
}
- (void)addTime{
     self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(move) userInfo:nil repeats:YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTime];
}
- (void)move{
    NSInteger pageNum = self.pageControl.currentPage;
    if (pageNum == 5) {
        pageNum = 0;
    }else{
        pageNum ++;
    }
   self.scrollView.contentOffset = CGPointMake(pageNum * kWidth, 0);
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat pageWidth = self.scrollView.frame.size.width;
    CGFloat width = self.scrollView.contentOffset.x;
    NSInteger pageNum = width / pageWidth;
    self.pageControl.currentPage = pageNum;

}
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    UIImageView *zoom = (UIImageView *)[scrollView viewWithTag:110];
    return zoom;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
