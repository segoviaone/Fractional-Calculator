//
//  Fraction.h
//  Program3B
//
//  Created by mcm2737 on 6/21/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//
//  PK example - Where has it gone?

#import <UIKit/UIKit.h>

@interface Fraction : NSObject

@property int numerator, denominator;

- (void) print;
//- (void) setNumerator: (int) n;
//- (void) setDenominator: (int) d;
//- (int) numerator;
//- (int) denominator;

- (void) setTo: (int) n over: (int) d;

//- (void) add:(Fraction *) f;  see unit seven
- (Fraction *) add: (Fraction *)f;
- (Fraction *) subtract: (Fraction *)f;
- (Fraction *) multiply: (Fraction *)f;
- (Fraction *) divide: (Fraction *)f;


- (void) reduce;

- (double) convertToNum;
- (NSString *) convertToString;

@end
