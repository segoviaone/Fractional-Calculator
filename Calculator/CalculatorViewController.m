//
//  CalculatorViewController.m
//  Calculator
//
//  Created by mcm2737 on 9/19/13.
//  Copyright (c) 2013 Absolutely Learning. All rights reserved.
//

#import "CalculatorViewController.h"
#import "calculator.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController

{
    char op;
    int currentNumber;
    BOOL firstOperand, isNumerator;
    calculator *myCalculator;
    NSMutableString *displayString;
}

@synthesize display;


- (void)viewDidLoad
{
    // Override point for customization after application launch
    
    firstOperand = YES;
    isNumerator = YES;
    displayString = [NSMutableString stringWithCapacity: 40];
    myCalculator = [[calculator alloc] init];
}

-(void) processDigit:(int)digit
{
    currentNumber = currentNumber * 10 + digit;
    
    [displayString appendString:
     [NSString stringWithFormat: @"%i", digit]];
    display.text = displayString;
}

-(IBAction) clickDigit:(UIButton *)sender
{
    int digit = sender.tag;
    [self processDigit: digit];
}


-(void) processOp:(char)theOp
{
    NSString *opStr;
    op = theOp;
    
    switch (theOp) {
            case '+':
            opStr = @" + ";
            break;
            case '-':
            opStr = @" - ";
            break;
            case '*':
            opStr = @" x ";
            break;
            case '/':
            opStr = @" div ";
            break;
    }
    
    [self storeFractPart];
    firstOperand = NO;
    isNumerator = YES;
    
    [displayString appendString: opStr];
    display.text = displayString;
    
}

-(void) storeFractPart
// this needs to be reviewed for better understanding of the logic
{
    if (firstOperand) {
        if (isNumerator) {
            myCalculator.operand1.numerator = currentNumber;
            myCalculator.operand1.denominator = 1;
        }
        else
            myCalculator.operand1.denominator = currentNumber;
    }
    else if (isNumerator) {
        myCalculator.operand2.numerator = currentNumber;
        myCalculator.operand2.denominator = 1;
    }
    else {
        myCalculator.operand2.denominator = currentNumber;
        firstOperand = YES;
    }
    
    currentNumber = 0;
    
}

-(IBAction) clickOver
{
    [self storeFractPart];
    isNumerator = NO;
    [displayString appendString: @"/"];
    display.text = displayString;
}

// Arithmetic Operation keys

-(IBAction) clickPlus
{
    [self processOp: '+'];
}

-(IBAction) clickMinus
{
    [self processOp: '-'];
}

-(IBAction) clickMultiply
{
    [self processOp: '*'];
}

-(IBAction) clickDivide
{
    [self processOp: '/'];
}

// Misc. Keys

-(IBAction) clickEquals
{
if ( firstOperand == NO) {
    [self storeFractPart];
    [myCalculator performOperation: op];
    
    [displayString appendString: @" = "];
    [displayString appendString: [myCalculator.accumulator convertToString]];
     display.text = displayString;
    
    currentNumber = 0;
    isNumerator = YES;
    firstOperand = YES;
    [displayString setString: @""];
    
}
}

-(IBAction) clickClear
{
    isNumerator = YES;
    firstOperand = YES;
    currentNumber = 0;
    [myCalculator clear];
    
    [displayString setString: @""];
    display.text = displayString;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
