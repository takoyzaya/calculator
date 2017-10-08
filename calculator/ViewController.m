//
//  ViewController.m
//  calculator
//
//  Created by Руслан Курбангалиев on 05.10.2017.
//  Copyright © 2017 Руслан Курбангалиев. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

double capacity(double a) {
    while(a >= 1) {
        a = a/10.0f;
    }
    return a;
}

- (IBAction)point:(id)sender{
    pointCheck = YES;
}

- (IBAction)clear:(id)sender{
    dispValue = 0;
    intPart = 0;
    doublePart = 0;
    pointCheck = NO;
    [self tablo];
}
- (IBAction)allClear:(id)sender{
    dispValue = 0;
    intPart = 0;
    doublePart = 0;
    operationEnter = NO;
    doubleOperatoin = NO;
    pointCheck = NO;
    memoryValue = 0;
    operationValue = ' ';
    [self tablo];
    [self tabloOperation];
}
- (IBAction)num:(id)sender{
    if (operationEnter) {
        memoryValue = dispValue;
        dispValue = 0;
        intPart = 0;
        doublePart = 0;
        pointCheck = NO;
        operationEnter = NO;
    }
    if (pointCheck == NO) {
        intPart = (intPart * 10.0f) + [sender tag];
        dispValue = intPart;
    } else {
        doublePart = (doublePart * 10.0f) + [sender tag];
        dispValue = intPart + capacity(doublePart);
    }
    [self tablo];
}
- (IBAction)operation:(id)sender{
    
    if (doubleOperatoin) {
        
        if (!operationEnter) {
    
            if (operation == 104) {
                    dispValue = dispValue * memoryValue;
                }
            if (operation == 105) {
                    dispValue = memoryValue / dispValue;
                }
            if (operation == 106) {
                    dispValue = dispValue + memoryValue;
                }
            if (operation == 107) {
                    dispValue = memoryValue - dispValue;
                }
        
        }
        
    }
    memoryValue = dispValue;
    operation = [sender tag];
    switch (operation) {
        case 104:
            operationValue = '*';
            break;
        case 105:
            operationValue = '/';
            break;
        case 106:
            operationValue = '+';
            break;
        case 107:
            operationValue = '-';
            break;
        case 108:
            operationValue = '=';
            break;
        default:
            break;
    }
    
    operationEnter = YES;
    doubleOperatoin = YES;
    [self tabloOperation];
    [self tablo];
    
}
- (IBAction)inverse:(id)sender{
    dispValue = -dispValue;
    [self tablo];
}
- (IBAction)mrMemory:(id)sender{
    MROperation = [sender tag];
    if (MROperation == 110) {
        if (operationEnter) {
            memoryValue = dispValue;
            dispValue = 0;
            intPart = 0;
            doublePart = 0;
            pointCheck = NO;
            operationEnter = NO;
        }
        dispValue = MRMemory;
        [self tablo];
    }
    if (MROperation == 111) {
        MRMemory = dispValue;
        operationEnter = YES;
    }
    if (MROperation == 112) {
        MRMemory = 0;
    }
}
- (IBAction)sqrtButton:(id)sender{
    dispValue = sqrt(dispValue);
    operationEnter = YES;
    [self tablo];
}

- (void) tablo {
    
    NSString *str = [NSString stringWithFormat: @"%g  ", dispValue];
    
    [displayLabel setText:str];
    
}

- (void) tabloOperation {
    
    NSString *str = [NSString stringWithFormat: @"%c  ", operationValue];
    
    [displayLabelOperation setText:str];
    
}

@end
