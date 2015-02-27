//
//  FormInputViewController.h
//  Training
//
//  Created by María Eugenia Sakuda on 2/24/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormInputViewController : UIViewController

- (BOOL)isValidEmail:(NSString *)email;
//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)setButtonAsLabelLink:(UIButton *)button;
- (IBAction)termsAction:(id)sender;

@end

