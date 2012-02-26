//
//  RestaurantBestDishesItemController.m
//  prokopsoft
//
//  Created by Petr Prokop on 1/20/12.
//  Copyright (c) 2012 prokopsoft. All rights reserved.
//

#import "PPJCItemController.h"

@implementation PPJCItemController

@synthesize view;
@synthesize delegate;

#pragma mark - init/dealloc

- (id)init
{
    self = [super init];
    
    if(self)
    {
        self.jumpIndex = 0;
        
        self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50 , 50)];
        self.view.alpha = 0.5f;
        self.view.backgroundColor = [UIColor blackColor];
        [self.view release];
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        _label.textAlignment = UITextAlignmentCenter;
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont fontWithName:@"HelveticaNeue" size:12.0f];
        [self.view addSubview:_label];
        [_label release];

    }
    
    return self;
}

- (void)dealloc
{
    self.view = nil;
}

- (void)setJumpIndex:(NSInteger) index
{
    _jumpIndex = index;
    _label.text = [NSString stringWithFormat:@"%i", index];
}

- (NSInteger)jumpIndex
{
    return _jumpIndex;
}

@end
