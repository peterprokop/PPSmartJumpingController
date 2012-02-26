//
//  PRSJViewController.m
//  PRSmartJumpingExample
//
//  Created by Petr Prokop on 1/28/12.
//  Copyright (c) 2012 prokopsoft. All rights reserved.
//

#import "PRSJViewController.h"
#import "PPJCItemController.h"

@implementation PRSJViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    _smartJumpingController = 
    [[PPSmartJumpingController alloc] initWithFrame:CGRectMake(0, 
                                                               (self.view.bounds.size.height - 50)/2, 
                                                               self.view.bounds.size.width,
                                                               50)];
    _smartJumpingController.spaceBetweenItems = 2.0f;
    _smartJumpingController.itemSize = CGSizeMake(50, 50);
    [self.view addSubview:_smartJumpingController.view];
    
    //we are going to show 100 items in total in our scroll view
    _smartJumpingController.itemCount = 100;
    
    /*
     with only 7 controllers! cool, right?
     take a note that total number of controllers needed depends on itemSize, spaceBetweenItems and jumping controller visible width
     */
    for(NSInteger i=0; i<8; i++)
    {
        PPJCItemController *itemController = [[PPJCItemController alloc] init];
        itemController.delegate = self;
        itemController.jumpIndex = i;
        [_smartJumpingController addItem:itemController];
    }
    
    [_smartJumpingController alignItems];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
