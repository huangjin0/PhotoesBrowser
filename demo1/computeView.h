//
//  computeView.h
//  demo1
//
//  Created by huangjin on 16/1/27.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define SCRRENHEIGHT  [UIScreen  mainScreen].bounds.size.height
#define SCRRENWIDTH    [UIScreen mainScreen].bounds.size.width
#define CACULATECENTREORIGN(x) ((SCRRENWIDTH-x)/2.0)
#define CACULATECENTREORIGNY(x) ((SCRRENHEIGHT-x)/2.0)
@interface computeView : NSObject
-(CGSize)caculateSize:(UIImage*)image;
-(NSMutableDictionary*)caculate:(UIImage*)image;
@end
