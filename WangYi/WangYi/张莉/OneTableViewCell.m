//
//  OneTableViewCell.m
//  WangYi
//
//  Created by scjy on 15/12/30.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "OneTableViewCell.h"


#define KWidth [UIScreen mainScreen].bounds.size.width
@interface OneTableViewCell ()
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic, retain) NSTimer *timer;
@property(nonatomic, retain) UIPageControl *pageControl;
@property(nonatomic, retain) NSArray *array;
@end


@implementation OneTableViewCell



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self load];
    }
    return self;
}

- (void)load{
    self.array = @[@"涉江采芙蓉", @"兰泽多芳草", @"采之欲遗谁", @"所思在远道", @"且向长安过暮春"];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth / 2)];
    self.scrollView.contentSize = CGSizeMake(KWidth * 5, KWidth / 2);
    //self.scrollView.pagingEnabled = YES;
    for (int i = 0; i < 5; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, KWidth, KWidth / 2)];
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(5, KWidth * 3 / 8, KWidth, 40)];
        lable.font = [UIFont systemFontOfSize:20];
        lable.textColor = [UIColor whiteColor];
        lable.text = self.array[i];
        NSString *str = [NSString stringWithFormat:@"%d.jpg", i + 1];
        imageView.image = [UIImage imageNamed:str];
        imageView.tag = 001;
        UIScrollView *scrollView1 = [[UIScrollView alloc] initWithFrame:CGRectMake(KWidth * i, 0, KWidth, KWidth / 2)];
        scrollView1.delegate = self;
        [imageView addSubview:lable];
        [scrollView1 addSubview:imageView];
        [self.scrollView addSubview:scrollView1];
    }
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, KWidth / 2 - 20, KWidth, 10)];
    self.pageControl.numberOfPages = 5;
    
    [self.pageControl addTarget:self action:@selector(pageSelectAction:) forControlEvents:UIControlEventValueChanged];
    
    self.scrollView.delegate = self;
    [self addSubview:self.pageControl];
    
    [self addTimer];
    
}

- (void)nextImage{
    int page = (int)self.pageControl.currentPage;
    if (page == 4) {
        page = 0;
    } else {
        page++;
    }
    CGFloat x = page * KWidth;
    self.scrollView.contentOffset = CGPointMake(x, 0);
}

- (void)pageSelectAction:(UIPageControl *)select{
    NSInteger pageNumber = select.currentPage;
    CGFloat width = self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(pageNumber * width, 0);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat width = self.scrollView.frame.size.width;
    CGPoint offset = self.scrollView.contentOffset;
     NSInteger pageNum = offset.x / width;
    self.pageControl.currentPage = pageNum;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

- (void)addTimer{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}












@end
