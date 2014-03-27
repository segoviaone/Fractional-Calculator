//
//  calculator.h
//  Calculator
//
//  Created by mcm2737 on 9/19/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//
#import "UIKit/UIKit.h"
#import "Fraction.h"

@interface calculator : NSObject

@property (strong, nonatomic) Fraction *operand1, *operand2, *accumulator;

-(Fraction *) performOperation: (char) op;
-(void) clear;

@end
