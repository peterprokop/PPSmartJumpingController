//
//  RestaurantBestDishesItemController.h
//  prokopsoft
//
//  Created by Petr Prokop on 1/20/12.
//  Copyright (c) 2012 prokopsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PPSmartJumpingController.h"

@interface PPJCItemController : NSObject<PPSmartJumpingDelegate>
{
    UILabel *_label;
    NSInteger _jumpIndex;
}

@property (readwrite, assign) NSInteger jumpIndex;
@property (nonatomic, retain) UIView *view;
@property (nonatomic, assign) id delegate;

- (void)setJumpIndex:(NSInteger) index;

@end
