//
//  SmartJumpingController.h
//  prokopsoft
//
//  Created by Petr Prokop on 1/20/12.
//  Copyright (c) 2012 prokopsoft. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PPSmartJumpingDelegate <NSObject>

@property (readwrite, assign) NSInteger jumpIndex;
@property (nonatomic, retain) UIView *view;

- (void)setJumpIndex:(NSInteger) index;

@end

@interface PPSmartJumpingController : NSObject<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
}

@property (nonatomic, retain) UIView *view;
@property (nonatomic, retain) NSMutableArray *itemControllers;
@property (readwrite, assign) CGSize itemSize;
@property (readwrite, assign) CGFloat spaceBetweenItems;
@property (readwrite, assign) NSInteger itemCount;

- (id)initWithFrame:(CGRect) frame;
- (void)addItem:(id<PPSmartJumpingDelegate>) controller;
- (void)alignItems;

@end
