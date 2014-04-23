//
//  BackgroundView.m
//  SimplePieChart
//
//  Created by subo on 14-4-23.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "BackgroundView.h"

@implementation BackgroundView

@synthesize backgroundColor = _backgroundColor;
@synthesize center = _center;

- (void)drawRect:(NSRect)dirtyRect {
    NSRect bounds = [self bounds];
    
    if (self.backgroundColor) {
        NSRectFill(bounds);
    }
}

- (void)dealloc
{
    [_backgroundColor release];
    [super dealloc];
}

@end
