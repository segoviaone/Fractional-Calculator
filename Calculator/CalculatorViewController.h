//
//  CalculatorViewController.h
//  Calculator
//
//  Created by mcm2737 on 9/19/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *display;

-(void) processDigit: (int) digit;
-(void) processOp: (char) theOp;
-(void) storeFractPart;

// Numeric Keys

-(IBAction) clickDigit: (UIButton *) sender;

// Arithmetic Operation Keys

-(IBAction) clickPlus;
-(IBAction) clickMinus;
-(IBAction) clickMultiply;
-(IBAction) clickDivide;

// Miscellaneous Keys

-(IBAction) clickOver;
-(IBAction) clickEquals;
-(IBAction) clickClear;


@end
