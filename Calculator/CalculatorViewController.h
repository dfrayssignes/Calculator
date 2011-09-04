//
//  CalculatorViewController.h
//  Calculator
//
//  Created by Denis Frayssignes on 08/08/2011.
//

#import <UIKit/UIKit.h>
#import "CalculatorBrain.h"

@interface CalculatorViewController : UIViewController
{
    IBOutlet UILabel *display;
    IBOutlet UILabel *displayOperation;
    @private
    CalculatorBrain *brain;
    BOOL userIsInTheMiddleOfTypingNumber;
    BOOL dotAllowed;
}

-(IBAction)digitPressed:(UIButton *)sender;
-(IBAction)operationPressed:(UIButton *)sender;

@end
