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
    UILabel*label;
    
}

@property (nonatomic,assign) NSInteger    num;//总的页数
@property (nonatomic,assign) NSInteger    currentPage;//当前页
@property (nonatomic,strong) UIScrollView *scrollView;
@property(nonatomic,assign)BOOL     isShowPageControl;

@end
@implementation PhotoLabstream
@synthesize  isShowPageControl;
-(id)initWithFrame:(CGRect)frame Images:(NSArray*)array isShowPage:(BOOL)isShowPage;
{
    if (self=[super initWithFrame:frame]) {

        [self setFrame:[UIScreen mainScreen].bounds];
        self.scrollView=[[UIScrollView alloc]init];
        isShowPageControl=isShowPage;
        [self addSubview:self.scrollView];
        if (isShowPageControl) {
             page=[[UIPageControl alloc]init];
            [self insertSubview:page aboveSubview:self.scrollView];
        }else{
        
            label=[[UILabel alloc]init];
            [self insertSubview:label aboveSubview:self.scrollView];
        }
       
        
       
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
    if (isShowPageControl) {
      [self setScollViewPage];
    }else{
        
       [self setLabel];
    
    }
    

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

-(void)setLabel
{
     CGFloat labelWdth   = 80;
    [label setFrame:CGRectMake(CACULATECENTREORIGN(labelWdth), SCRRENHEIGHT-20.0, labelWdth, 20.0)];
    [label setText:[NSString stringWithFormat:@"1 %@ %ld",@"/",self.photoes.count]];
    [label setTextColor:[UIColor whiteColor]];

}
//设置UIPageControl
-(void)setScollViewPage
{
    CGFloat pageWdth   = self.photoes.count*2.0;

    [page setFrame:CGRectMake(CACULATECENTREORIGN(pageWdth), SCRRENHEIGHT-20.0, pageWdth, 20.0)];
    page.numberOfPages = self.photoes.count;
    page.currentPage   = 0;
    page.pageIndicatorTintColor=self.pageIndicatorColor;
    page.currentPageIndicatorTintColor=self.currentPageIndicatorColor;

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
    
    if (isShowPageControl) {
  page.currentPage=(int)_scrollView.contentOffset.x/scrollView.frame.size.width;
    }else
    {
  int currrent=(int)_scrollView.contentOffset.x/scrollView.frame.size.width;
        
        [label setText:[NSString stringWithFormat:@"%d %@ %ld",currrent+1,@"/",self.photoes.count]];
    }
  

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
