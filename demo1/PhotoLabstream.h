//
//  PhotoLabstream.h
//  demo1
//
//  Created by huangjin on 16/1/27.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoLabstream : UIView

@property (nonatomic,strong) NSArray *photoes;//照片数组

-(id)initWithFrame:(CGRect)frame Images:(NSArray*)array;
-(void)show;

@end
