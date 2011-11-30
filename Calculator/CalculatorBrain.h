//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Denis Frayssignes on 08/08/2011.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
{
    @private
    NSDecimalNumber *operand;
    NSString *waitingOperation;
    NSDecimalNumber *waitingOperand;
}

- (void)setOperand:(NSDecimalNumber *)anOperand;
- (NSDecimalNumber *)performOperation:(NSString *)operation;

@end
