//
//  FormInputViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/24/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "FormInputViewController.h"
#import "InformationAPI.h"
#define WOLOX @"http://www.wolox.com.ar"

@implementation FormInputViewController

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)setButtonAsLabelLink: (UIButton *)button{
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"Terms & Conditions", nil)];
    
    // making text property to underline text-
    [titleString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [titleString length])];
    
    [titleString addAttribute:NSForegroundColorAttributeName
                        value:[UIColor blackColor]
                        range:NSMakeRange(0, [titleString length])] ;
    
    // using text on button
    [button setAttributedTitle: titleString forState:UIControlStateNormal];
}

- (IBAction)termsAction:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:WOLOX]];
}

@end
