//
//  AppDelegate.h
//  SimplePieChart
//
//  Created by subo on 14-4-23.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PieChart.h"


@interface AppDelegate : NSObject <NSApplicationDelegate,PieChartDataSource,PieChartDelegate> {
    IBOutlet PieChart *_pieChart;
}

@property (assign) IBOutlet NSWindow *window; 
@property(nonatomic, retain) NSMutableArray *slices;
@property(nonatomic, strong) NSArray        *sliceColors;

@end
