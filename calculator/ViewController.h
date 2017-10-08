//
//  ViewController.h
//  calculator
//
//  Created by Руслан Курбангалиев on 05.10.2017.
//  Copyright © 2017 Руслан Курбангалиев. All rights reserved.
//

#import <UIKit/UIKit.h>

double dispValue, memoryValue, intPart, doublePart, MRMemory;
NSInteger operation, MROperation;
BOOL pointCheck, doubleOperatoin, operationEnter, MPlusEnter;
double capacity(double a);
char operationValue;

@interface ViewController : UIViewController{
    
    
    
    IBOutlet UILabel *displayLabel;
    
    IBOutlet UILabel *displayLabelOperation;
    
}

- (IBAction)clear:(id)sender;

- (IBAction)allClear:(id)sender;

- (IBAction)num:(id)sender;

- (IBAction)operation:(id)sender;

- (IBAction)inverse:(id)sender;

- (IBAction)point:(id)sender;

- (IBAction)mrMemory:(id)sender;

- (IBAction)sqrtButton:(id)sender;

@end

