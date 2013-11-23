//
//  simulationOutcome.m
//  XYPieChart
//
//  Created by Tia on 11/18/13.
//  Copyright (c) 2013 Xiaoyang Feng. All rights reserved.
//

#import "simulationOutcome.h"

@implementation simulationOutcome
@synthesize simOutcome = _simOutcome;
@synthesize myView = _myView;

-(id) init{
    _simOutcome = [[NSMutableArray alloc] initWithCapacity:35];
    return self;
}

- (id) initWith: (NSString*)retrievedData view: (UIView*) myView{
    NSArray *keyArray = [[NSArray alloc] initWithObjects: @"runID", @"studyID",@"privateInstall",@"publicInstall",@"privateMaintain", @"publicMaintain", @"privateDamage", @"publicDamage", @"timeToFlood", @"timeToLargeFlood", @"timeOfFlood", @"timeOfLargeFlood", @"timeToDry",@"waterInSewers", @"runOff", @"waterInAllGI",@"waterInRoofs", @"waterInRainBarrels", @"waterInSwales", @"privateInstallN", @"publicInstallN",@"publicMaintainN", @"publicDamageN", @"privateDamageN",@"privateMaintainN", @"timeToFloodN", @"timeOfFloodN", @"timeToLargeFloodN", @"timeOfLargeFloodN", @"timeToDryN", @"waterInSewersN", @"runOffN",@"waterInAllGIN",@"waterInRoofsN", @"waterInRainBarrelsN", @"waterInSwalesN", nil];
    NSArray *captureData = [retrievedData componentsSeparatedByString:@"\n"];
    _simOutcome = [[NSMutableArray alloc] initWithCapacity:captureData.count];
    for( int i = 0; i < captureData.count; i++){
        NSString *recordText = [ [captureData objectAtIndex:i ] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"record text of line %d %@", i, recordText);
        NSMutableArray *record = [[recordText componentsSeparatedByString: @" \t"] mutableCopy];
        NSLog(@"recordNumber: %d %@", record.count, record);
        if(record.count == keyArray.count){
            NSMutableDictionary *recordDic =[[NSMutableDictionary alloc] initWithObjects:record forKeys:keyArray];
            [_simOutcome addObject:recordDic];
        }
        
    }
    for(int i = 0 ; i < _simOutcome.count; i++){
        NSLog(@"outcome i:%d \n %@\n\n" , i, [_simOutcome objectAtIndex:i]);
    }
    _myView = myView;
    [self showScoresTemp];
    return self;
}

- (void) showScoresTemp {
    for(int i=0; i<_simOutcome.count; i++){
        NSMutableDictionary *x = [_simOutcome objectAtIndex:i];
        UILabel *timeToFlood = [[UILabel alloc] initWithFrame:CGRectMake(11+ i*200, 420, 150, 20)];
        timeToFlood.text = @"Time To Flood (in minutes)";
        timeToFlood.backgroundColor = [UIColor clearColor];
        timeToFlood.font = [UIFont systemFontOfSize:12];
        UILabel *timeToFloodValue = [[UILabel alloc] initWithFrame:CGRectMake(11+ i*200, 435, 150, 20)];
        timeToFloodValue.text = [x objectForKey:@"timeToFlood"];
        timeToFloodValue.backgroundColor = [UIColor clearColor];
        timeToFloodValue.font = [UIFont systemFontOfSize:10];
        [_myView addSubview:timeToFlood];
        [_myView addSubview:timeToFloodValue];
        UILabel *totalInstall = [[UILabel alloc] initWithFrame:CGRectMake(11+ i*200, 460, 150, 20)];
        totalInstall.text = @"Total Install Cost";
        totalInstall.backgroundColor = [UIColor clearColor];
        totalInstall.font = [UIFont systemFontOfSize:12];
        UILabel *totalInstallValue = [[UILabel alloc] initWithFrame:CGRectMake(11+ i*200, 475, 150, 20)];
        float totalCost = [[x objectForKey:@"privateInstall"] floatValue]+ [[x objectForKey:@"publicInstall"] floatValue];
        totalInstallValue.text = [NSString stringWithFormat:@"%f", totalCost];
        totalInstallValue.backgroundColor = [UIColor clearColor];
        totalInstallValue.font = [UIFont systemFontOfSize:10];
        [_myView addSubview:totalInstall];
        [_myView addSubview:totalInstallValue];
        UILabel *waterInGI = [[UILabel alloc] initWithFrame:CGRectMake(11+ i*200, 515, 150, 20)];
        waterInGI.text = @"Water Stored in All GI";
        waterInGI.backgroundColor = [UIColor clearColor];
        waterInGI.font = [UIFont systemFontOfSize:12];
        UILabel *waterInGIValue = [[UILabel alloc] initWithFrame:CGRectMake(11+ i*200, 530, 150, 20)];
        waterInGIValue.text = [x objectForKey:@"waterInAllGI"];
        waterInGIValue.backgroundColor = [UIColor clearColor];
        waterInGIValue.font = [UIFont systemFontOfSize:10];
        [_myView addSubview:waterInGI];
        [_myView addSubview:waterInGIValue];
        
    }
}
@end
