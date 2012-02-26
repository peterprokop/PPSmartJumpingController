//
//  SmartJumpingController.m
//  prokopsoft
//
//  Created by Petr Prokop on 1/20/12.
//  Copyright (c) 2012 prokopsoft. All rights reserved.
//

#import "PPSmartJumpingController.h"
#import <QuartzCore/QuartzCore.h>

@implementation PPSmartJumpingController

@synthesize view;
@synthesize itemControllers;
@synthesize itemSize;
@synthesize spaceBetweenItems;
@synthesize itemCount;

#pragma mark - init/dealloc

- (id)initWithFrame:(CGRect) frame
{
    self = [super init];
    
    if(self)
    {
        self.view = [[UIView alloc] initWithFrame:frame];
        [self.view release];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 
                                                                     0, 
                                                                     frame.size.width, 
                                                                     frame.size.height)];
        _scrollView.delegate = self;
        _scrollView.scrollEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_scrollView];
        
        self.itemControllers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    self.itemControllers = nil;
    self.view = nil;
    [_scrollView release];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger controllersCount = [self.itemControllers count];
    
    for(id<PPSmartJumpingDelegate> controller in self.itemControllers)
    {
        CGRect contentRect = CGRectMake(scrollView.contentOffset.x, 
                                        scrollView.contentOffset.y, 
                                        scrollView.frame.size.width, 
                                        scrollView.frame.size.height);
        
        CGRect currentViewFrame = controller.view.frame;
        
        //controller view is not visible
        if(!CGRectIntersectsRect(currentViewFrame, contentRect))
        {
            //scroll view is scrolling to the right
            if(currentViewFrame.origin.x < scrollView.contentOffset.x)
            {
                NSInteger newJumpIndex = controller.jumpIndex + controllersCount;
                
                if(newJumpIndex < 0 || newJumpIndex >= self.itemCount)
                    return;
                
                [controller setJumpIndex:newJumpIndex];
                currentViewFrame.origin.x += controllersCount*itemSize.width + (controllersCount)*spaceBetweenItems;
            }
            //scroll view is scrolling to the left
            else
            {
                NSInteger newJumpIndex = controller.jumpIndex - controllersCount;
                
                if(newJumpIndex < 0 || newJumpIndex >= self.itemCount)
                    return;
                
                [controller setJumpIndex:newJumpIndex];
                currentViewFrame.origin.x -= controllersCount*itemSize.width + (controllersCount)*spaceBetweenItems;
            }
            
            controller.view.frame = currentViewFrame;
        }
    }
}

- (void)addItem:(id<PPSmartJumpingDelegate>) controller
{
    //return if number of items is less than number of controllers (or number of items visible at a time)
    if([self.itemControllers count] >= self.itemCount)
        return;
    
    
    [self.itemControllers addObject:controller];
    [_scrollView addSubview:controller.view];
}

- (void)alignItems
{
    for(NSInteger i=0; i<[self.itemControllers count]; i++)
    {
        id<PPSmartJumpingDelegate> controller = [self.itemControllers objectAtIndex:i];
        
        controller.view.frame = CGRectMake(spaceBetweenItems + (itemSize.width + spaceBetweenItems)*i, 
                                           (self.view.frame.size.height - itemSize.height)/2, 
                                           itemSize.width, 
                                           itemSize.height);
    }
    
    _scrollView.contentSize = CGSizeMake(spaceBetweenItems*2 + (itemSize.width + spaceBetweenItems)*self.itemCount,
                                         _scrollView.frame.size.height);
}

@end