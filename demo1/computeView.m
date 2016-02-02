//
//  computeView.m
//  demo1
//
//  Created by huangjin on 16/1/27.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import "computeView.h"
#define SPACE 2

@implementation computeView
//计算布局

-(CGSize)caculateSize:(UIImage*)image
{
    CGSize size=image.size;
    if (size.width<SCRRENWIDTH-SPACE*2&&size.height<SCRRENHEIGHT-2*SPACE) {
        return size;
    }
    if (size.width>SCRRENWIDTH-SPACE*2) {
       
        float scale=size.width/size.height;
        float rW=SCRRENWIDTH-SPACE*2;
        float rH=rW/scale;
        return CGSizeMake(rW, rH);
    }
    if (size.width<SCRRENWIDTH-SPACE*2&&size.height>SCRRENHEIGHT-2*SPACE) {
        
        float scale=size.width/size.height;
        float rH=SCRRENHEIGHT-SPACE*2;
        float rW=rH*scale;
        return CGSizeMake(rW, rH);
    }
   
    return size;
  
}
-(NSMutableDictionary*)caculate:(UIImage*)image
{
    NSMutableDictionary*dic=[[NSMutableDictionary alloc]init];

    CGSize size = image.size;
    UIImage*showImage;
    // 大于屏幕宽度
    if (size.width>SCRRENWIDTH&&size.height<SCRRENHEIGHT) {
        [self screenshot:image RECT:CGRectMake(0, 0, SCRRENWIDTH, size.height)];
    showImage   = [self screenshot:image RECT:CGRectMake(0, 0,SCRRENWIDTH, size.height)];
        [dic setObject:showImage forKey:@"image"];
        [dic setObject:NSStringFromCGSize(CGSizeMake(SCRRENWIDTH,SCRRENHEIGHT)) forKey:@"showSize"];
        return dic;

        //大于屏幕高度
    }else if (size.width<SCRRENWIDTH&&size.height>SCRRENHEIGHT){


    showImage   = [self screenshot:image RECT:CGRectMake(0, 0,size.width, SCRRENHEIGHT)];
        [dic setObject:showImage forKey:@"image"];
        [dic setObject:NSStringFromCGSize(CGSizeMake(SCRRENWIDTH,SCRRENHEIGHT)) forKey:@"showSize"];
        return dic;

        //大于屏幕宽度和高度
    }else if(size.width>SCRRENWIDTH&&size.height>SCRRENHEIGHT){

    showImage   = [self screenshot:image RECT:CGRectMake(0, 0,SCRRENWIDTH, SCRRENHEIGHT)];
        [dic setObject:showImage forKey:@"image"];
        [dic setObject:NSStringFromCGSize(CGSizeMake(SCRRENWIDTH,SCRRENHEIGHT)) forKey:@"showSize"];
        return dic;

    }//正常显示
    else
    {
    showImage   = image;
    [dic setObject:showImage forKey:@"image"];
    [dic setObject:NSStringFromCGSize(image.size) forKey:@"showSize"];
        return dic;

    }

    return nil;

}
//截取图片
-(UIImage*)screenshot:(UIImage*)image RECT:(CGRect)rect
{
    CGImageRef subImageRef = CGImageCreateWithImageInRect(image.CGImage, rect);
    CGRect smallBounds = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(smallBounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextDrawImage(context, smallBounds, subImageRef);
    UIImage* smallImage = [UIImage imageWithCGImage:subImageRef];
    UIGraphicsEndImageContext();
    return smallImage;
}

@end
