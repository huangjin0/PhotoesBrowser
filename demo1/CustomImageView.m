//
//  CustomImageView.m
//  demo1
//
//  Created by huangjin on 16/1/28.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import "CustomImageView.h"
#import "UIView+AddGesture.h"
#import "computeView.h"

@interface CustomImageView ()<UIGestureRecognizerDelegate>
{
    CGFloat lastScale;
    UIImageView*_imageView;
    

}
@end

@implementation CustomImageView

-(id)initWithFrame:(CGRect)frame{
    
    self=[super initWithFrame:frame];
    if (self) {
    _imageView=[[UIImageView alloc]initWithFrame:CGRectZero];
    [self addSubview:_imageView];
    [self addPinchGesture];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundColor=[UIColor redColor];
}
#pragma private 方法

-(void)addPinchGesture{
    
      UIPinchGestureRecognizer*gesture=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchImage:)];
    [_imageView setUserInteractionEnabled:YES];
    [_imageView setMultipleTouchEnabled:YES];
   [_imageView addGestureRecognizer:gesture];

}
#pragma 响应event
-(void)pinchImage:(id)sender{
    
   [self bringSubviewToFront:[(UIPinchGestureRecognizer*)sender view]];
    //当手指离开屏幕时,将lastscale设置为1.0
    if([(UIPinchGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {

        lastScale = 1.0;
        return;
    }
    
    CGFloat scale = 1.0 - (lastScale - [(UIPinchGestureRecognizer*)sender scale]);
    CGAffineTransform currentTransform = [[(UIPinchGestureRecognizer*)sender view] transform];
    CGAffineTransform newTransform = CGAffineTransformScale(currentTransform, scale, scale);
    [[(UIPinchGestureRecognizer*)sender view]setTransform:newTransform];
    lastScale = [(UIPinchGestureRecognizer*)sender scale];
    
}


#pragma getstureDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    
    return ![gestureRecognizer isKindOfClass:[UIPinchGestureRecognizer class]];

}
#pragma 属性
-(void)setImage:(UIImage *)image
{
    
    _image=image;
    _imageView.image=image;
computeView*com=[[computeView alloc]init];
    
   CGSize size=[com caculateSize:image];
    _imageView.frame=CGRectMake(CACULATECENTREORIGN(size.width), CACULATECENTREORIGNY(size.height), size.width, size.height);
}

-(void)setImageFrame:(CGRect)imageFrame
{
    _imageFrame=imageFrame;
    [_imageView setFrame:imageFrame];;

}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
