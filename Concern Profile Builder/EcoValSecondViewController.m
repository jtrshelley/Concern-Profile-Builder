//
//  EcoValSecondViewController.m
//  Concern Profile Builder
//
//  Created by Tia on 11/22/13.
//  Copyright (c) 2013 Tia. All rights reserved.
//

#import "EcoValSecondViewController.h"

@interface EcoValSecondViewController ()
@end

@implementation EcoValSecondViewController
@synthesize swaleCost = _swaleCost;
@synthesize paverCost = _paverCost;
@synthesize roofCost = _roofCost;
@synthesize barrelCost = _barrelCost;

@synthesize swaleNumber = _swaleNumber;
@synthesize paverNumber = _paverNumber;
@synthesize roofNumber = _roofNumber;
@synthesize barrelNumber = _barrelNumber;
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"touched outside editing box");
    [self.view endEditing:YES];
}

- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}

- (void) keyboardWasHidden: (NSNotification*) notif{
    _swaleCost.text = [NSString stringWithFormat: @"= $%d", 21000* [_swaleNumber.text integerValue]];
    _paverCost.text = [NSString stringWithFormat: @"= $%d", 5500* [_paverNumber.text integerValue]];
    _roofCost.text = [NSString stringWithFormat: @"= $%d", 125000* [_roofNumber.text integerValue]];
    _barrelCost.text = [NSString stringWithFormat: @"= $%d", 125* [_barrelNumber.text integerValue]];
}

@end
