//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Denis Frayssignes on 08/08/2011.
//

#import "CalculatorBrain.h"

@implementation CalculatorBrain

- (id)init
{
    self = [super init];
    if (self) {
        if (!operand)
            operand = [[NSDecimalNumber alloc] init];
        if (!waitingOperand)
            waitingOperand = [[NSDecimalNumber alloc] init];
    }
    
    return self;
}

- (void)setOperand:(NSDecimalNumber *)anOperand
{
    operand = anOperand;
}

- (NSDecimalNumber *)performOperation:(NSString *)operation
{
    if ([operation isEqual:@"√"]) {
        operand = operand;//NSDecimalNumber does not support sqrt...
    } else if ([operation isEqual:@"±"]) {
        NSDecimalNumber *minusOne = [[NSDecimalNumber alloc] initWithInt:-1];
        operand = [operand decimalNumberByMultiplyingBy:minusOne];
    } else if ([operation isEqual:@"C"]) {
        //operand = 0;
    } else if ([operation isEqual:@"1/x"]) {
        operand = [[NSDecimalNumber one] decimalNumberByDividingBy:operand];
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
        operand = [waitingOperand decimalNumberByAdding: operand];
    } else if ([@"-" isEqual:waitingOperation]) {
        operand = [waitingOperand decimalNumberBySubtracting: operand];
    } else if ([@"x" isEqual:waitingOperation]) {
        operand = [waitingOperand decimalNumberByMultiplyingBy: operand];
    } else if ([@"÷" isEqual:waitingOperation]) {
        if (![operand isEqualToNumber:[NSDecimalNumber zero]]) {
            operand = [waitingOperand decimalNumberByDividingBy: operand];
        }
    }
}

@end
