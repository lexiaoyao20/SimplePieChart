//
//  AppDelegate.m
//  SimplePieChart
//
//  Created by subo on 14-4-23.
//  Copyright (c) 2014年 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

#define Color(value) (value) / 255.0

@synthesize window = _window;
@synthesize slices = _slices;
@synthesize sliceColors = _sliceColors;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.slices = [NSMutableArray array];
    for(int i = 0; i < 5; i ++)
    {
        NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
        [_slices addObject:one];
    }
    
    [_pieChart setDelegate:self];
    [_pieChart setDataSource:self];
    [_pieChart setPieCenter:CGPointMake(240, 240)];
    [_pieChart setShowPercentage:NO];
    [_pieChart setTextColor:[NSColor blackColor]];
    
    self.sliceColors =[NSArray arrayWithObjects:
                       [NSColor colorWithDeviceRed:Color(246) green:Color(155) blue:0 alpha:1],
                       [NSColor colorWithDeviceRed:Color(129) green:Color(195) blue:Color(29) alpha:1],
                       [NSColor colorWithDeviceRed:Color(62) green:Color(173) blue:Color(129) alpha:1],
                       [NSColor colorWithDeviceRed:Color(229) green:Color(66) blue:Color(115) alpha:1],
                       [NSColor colorWithDeviceRed:Color(148) green:Color(141) blue:Color(139) alpha:1],nil];
    
    [_pieChart reloadData];
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(PieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(PieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (NSColor *)pieChart:(PieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(PieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %ld",index);
}
- (void)pieChart:(PieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %ld",index);
}
- (void)pieChart:(PieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %ld",index);
}
- (void)pieChart:(PieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %ld",index);
//    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}

@end
