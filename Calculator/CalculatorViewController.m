//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Denis Frayssignes on 08/08/2011.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController()
    @property(readonly) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

- (CalculatorBrain *)brain
{
    if (!brain){
        brain = [[CalculatorBrain alloc] init];
    }
    return brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    NSString *digit = [[sender titleLabel] text];
    if (![digit isEqual:@"."] || ([digit isEqual:@"."] && dotAllowed)) {
        if ([digit isEqual:@"."]) {
            dotAllowed = NO;
        }
        if (userIsInTheMiddleOfTypingNumber) {
            [display setText:[[display text] stringByAppendingString:digit]];
        } else {
            [display setText:digit];
            userIsInTheMiddleOfTypingNumber = YES;
        }
    }
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if (userIsInTheMiddleOfTypingNumber) {
         self.brain.operand = [[display text] doubleValue];
         userIsInTheMiddleOfTypingNumber = NO;
         dotAllowed = YES;
    }
    NSString *operation = [[sender titleLabel] text];
    [displayOperation setText:operation];
    if ([operation isEqual:@"C"]) {
        display.text = @"";
    } else {
        double result = [self.brain performOperation:operation];
        [display setText:[NSString stringWithFormat: @"%g", result]];
    }
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

@end
