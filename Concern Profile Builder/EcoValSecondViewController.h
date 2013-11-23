//
//  EcoValSecondViewController.h
//  Concern Profile Builder
//
//  Created by Tia on 11/22/13.
//  Copyright (c) 2013 Tia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EcoValSecondViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *swaleNumber;
@property (strong, nonatomic) IBOutlet UITextField *paverNumber;
@property (strong, nonatomic) IBOutlet UITextField *roofNumber;
@property (strong, nonatomic) IBOutlet UITextField *barrelNumber;
@property (strong, nonatomic) IBOutlet UILabel *swaleCost;
@property (strong, nonatomic) IBOutlet UILabel *paverCost;
@property (strong, nonatomic) IBOutlet UILabel *roofCost;
@property (strong, nonatomic) IBOutlet UILabel *barrelCost;

@end
