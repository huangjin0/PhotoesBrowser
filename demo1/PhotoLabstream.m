//
//  PhotoLabstream.m
//  demo1
//
//  Created by huangjin on 16/1/27.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import "PhotoLabstream.h"
#import "computeView.h"
#import "CustomImageView.h"
@interface PhotoLabstream()<UIScrollViewDelegate>
{
    UIPageControl*page;
    
}

@property (nonatomic,assign) NSInteger    num;//总的页数
@property (nonatomic,assign) NSInteger    currentPage;//当前页
@property (nonatomic,strong) UIScrollView *scrollView;

@end
@implementation PhotoLabstream

-(id)initWithFrame:(CGRect)frame Images:(NSArray*)array
{
    if (self=[super initWithFrame:frame]) {

        [self setFrame:[UIScreen mainScreen].bounds];
        self.scrollView=[[UIScrollView alloc]init];
        page=[[UIPageControl alloc]init];
        [self addSubview:self.scrollView];
       [self insertSubview:page aboveSubview:self.scrollView];
          self.photoes = array;
       [self addGesture];
    }
    return self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor=[UIColor blackColor];
    [self setScroolView];
    [self setScollViewPage];

}
#pragma public 方法
-(void)show
{
    self.backgroundColor=[UIColor blackColor];
    [[self getKeyWindowRootViewController].view addSubview:self.scrollView];
}


#pragma private方法
//#error 未完成

-(void)addGesture
{
    UITapGestureRecognizer*gesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:gesture];

}
-(IBAction)tap:(id)sender
{
    [self removeFromSuperview];
    
}
-(void)setScroolView
{
    if (self.photoes.count==0) {
        return;
    }
    //刚开始显示 CurrentPage=0；
     _currentPage = 0;
     for (id obj in self.photoes) {
        //如果对象为图片资源
        if ([obj isKindOfClass:[UIImage class]]) {
            UIImage*image=(UIImage*)obj;
            CustomImageView*imageView=[[CustomImageView alloc]initWithFrame:CGRectZero];
            [imageView setImage:image];
        [imageView setFrame:CGRectMake(SCRRENWIDTH*_currentPage,0, SCRRENWIDTH,SCRRENHEIGHT)];
            NSLog(@"imageview:%@",imageView);
            [_scrollView addSubview:imageView];
            _currentPage++;
        }
         [_scrollView setFrame:[UIScreen mainScreen].bounds];
         [_scrollView setBackgroundColor:[UIColor blackColor]];
         _scrollView.bounces=NO;
         _scrollView.pagingEnabled=YES;
         
         [_scrollView setContentSize:CGSizeMake(SCRRENWIDTH*_photoes.count, SCRRENHEIGHT)];
         [_scrollView setDelegate:self];
    }
}
//设置UIPageControl
-(void)setScollViewPage
{
    CGFloat pageWdth   = self.photoes.count*2.0;

    [page setFrame:CGRectMake(CACULATECENTREORIGN(pageWdth), SCRRENHEIGHT-20.0, pageWdth, 20.0)];
    page.numberOfPages = self.photoes.count;
    page.currentPage   = 0;
    page.pageIndicatorTintColor=[UIColor blueColor];
    page.currentPageIndicatorTintColor=[UIColor whiteColor];

    [page addTarget:self action:@selector(moveScollview) forControlEvents:UIControlEventTouchUpInside];
}

-(UIViewController*)getKeyWindowRootViewController
{
    return [UIApplication sharedApplication].keyWindow.rootViewController;
    
}
#pragma Event响应

-(void)moveScollview
{
//    [_scrollView setContentOffset:CGPointMake(page.currentPage*SCRRENWIDTH, 0) animated:YES];
}
#pragma scrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    
    NSLog(@"currentPage:%f",_scrollView.contentOffset.x);
  page.currentPage=(int)_scrollView.contentOffset.x/scrollView.frame.size.width;

}
#pragma 属性方法
-(void)setPhotoes:(NSArray *)photoes
{
    
    _photoes=photoes;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
