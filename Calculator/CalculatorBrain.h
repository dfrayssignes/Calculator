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
    double operand;
    NSString *waitingOperation;
    double waitingOperand;
}

@property double operand;

- (void)setOperand:(double)anOperand;
- (double)performOperation:(NSString *)operation;

@end
