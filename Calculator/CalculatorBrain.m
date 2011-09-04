//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Denis Frayssignes on 08/08/2011.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

@synthesize operand;

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (double)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"√"]) {
        operand = sqrt(operand);
    } else if ([operation isEqual:@"±"]) {
        operand = -operand;
    } else if ([operation isEqual:@"C"]) {
        //operand = 0;
    } else if ([operation isEqual:@"1/x"]) {
        operand = 1 / operand;
    }else{
        [self performWaitingOperation];
        waitingOperation = operation;
        waitingOperand = operand;
    }
    return operand;
}

- (void)performWaitingOperation
{
    if ([@"+" isEqual:waitingOperation]) {
        operand = waitingOperand + operand;
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = waitingOperand - operand;
    } else if ([@"x" isEqual:waitingOperation]) {
        operand = waitingOperand * operand;
    } else if ([@"÷" isEqual:waitingOperation]) {
        if (operand != 0) {
            operand = waitingOperand / operand;
        }
    }
}

@end
