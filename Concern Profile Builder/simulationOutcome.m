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

NSString *rootUrl = @"http://polarbear.evl.uic.edu/~evl/ecocollage/images/";

-(id) init{
    _simOutcome = [[NSMutableArray alloc] initWithCapacity:35];
    return self;
}

- (id) initWith: (NSString*)retrievedData view: (UIView*) myView{
    
    NSArray *captureData = [retrievedData componentsSeparatedByString:@"\n"];
    _simOutcome = [[NSMutableArray alloc] initWithCapacity:captureData.count];
    for( int i = 0; i < captureData.count; i++){
        NSString *recordText = [ [captureData objectAtIndex:i ] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"record text of line %d %@", i, recordText);
        NSArray *record = [recordText componentsSeparatedByString: @" \t"];
        NSLog(@"recordNumber: %d %@", record.count, record);
        if(record.count > 2){
            [_simOutcome addObject:record];
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
        NSString * fileName  = [[_simOutcome objectAtIndex:i] objectAtIndex: 40];
        NSString *path = [NSString stringWithFormat:@"%@%@", rootUrl, fileName];
        //NSLog(@"%@", path);
        NSURL *url = [NSURL URLWithString:path];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img = [[UIImage alloc] initWithData:data];
        CGSize size = img.size;
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        [imgView setFrame: CGRectMake( 25+ i*200, 425, size.width/2.75, size.height/2.75)];
        [_myView addSubview: imgView];
    }
}
@end
