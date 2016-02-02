//
//  CustomImageView.h
//  demo1
//
//  Created by huangjin on 16/1/28.
//  Copyright © 2016年 huangjin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomImageView : UIScrollView

@property(nonatomic,strong)UIImage*image;
@property(nonatomic,assign)CGRect imageFrame;
@property(nonatomic,assign)CGSize HcontenSize;
@end
