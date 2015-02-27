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

    //este método debería estar en el vmodel
- (BOOL)isValidEmail:(NSString *)email{
    NSString *pattern = @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, email.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:email options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    // Did we find a matching range
    if (matchRange.location != NSNotFound)
        didValidate = YES;
    
    return didValidate;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)setButtonAsLabelLink: (UIButton *)button{
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:@"Terms & Conditions"];
    
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
