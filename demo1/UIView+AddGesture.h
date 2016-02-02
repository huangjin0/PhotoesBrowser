//
//  UIView+AddGesture.h
//  GestureAddDemo
//
//  Created by WJ on 15/9/23.
//  Copyright © 2015年 WJ. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 *对手势类型进行枚举
 */
typedef enum {
    tapGesture                = 0,      //单击手势
    panGesture                = 1,      //拖移，慢速移动
    longPressGesture          = 2,      //长按
    pinchGesture              = 3,      //二指往內或往外拨动，平时经常用到的缩放
    rotationGesture           = 4,      //旋转
    swipeGesture              = 5,      //滑动，快速移动
} GestureType;

typedef void(^handleTapBlockKey)(UIGestureRecognizer*);


@interface UIView (AddGesture)
/*
 *所有手势类型
 */
@property (nonatomic, strong) UIGestureRecognizer *allGesture;
/*
 *手势操作
 */
@property (nonatomic, copy) handleTapBlockKey handleTapBlockKey;
/*
 *添加某种类型手势
 */
- (void)setGestureType:(GestureType)gestureType withBlock:(handleTapBlockKey)complete ;
/*
 *移除某种手势
 */
- (void)removeGestureType:(GestureType)gestureType withBlock:(handleTapBlockKey)complete;
/*
 *移除所有手势
 */
- (void)removeGesture:(void (^)(void))block;

@end
