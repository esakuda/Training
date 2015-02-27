//
//  LoginViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+Toast.h"
#import "InformationAPI.h"
#import "TTTAttributedLabel.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *termsAndConditionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self showElements:NO];
    [self.view makeToastActivity];
    
    [self validateLogin];
    
    [self.view hideToastActivity];
    [self showElements:YES];
    
    [self viewConfiguration];
}

- (IBAction)login:(id)sender {
    if([[InformationAPI getData] chekCredentials:self.emailText.text
                                        password:self.passwordText.text]){
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view makeToast:@"Email o contraseña incorrectas"];
        });
    }
}

- (BOOL)isValidEmail:(NSString *)email{
    return [super isValidEmail:email] && [self specialValidation:email];
}

-(BOOL)specialValidation:(NSString *)email{
    return [[InformationAPI getData] isAvaiableEmail:email];
}

-(void)showElements:(BOOL)show{
    self.signUpButton.hidden = !show;
    self.loginButton.hidden = !show;
    self.emailText.hidden = !show;
    self.passwordText.hidden = !show;
    self.termsAndConditionsButton.hidden = !show;
    self.termsAndConditionsLabel.hidden = !show;
}

- (void)viewConfiguration{
    [self.loginButton.layer setBorderWidth:1.0f];
    [self.loginButton.layer setBorderColor:[UIColor blackColor].CGColor];
    
    [self setButtonAsLabelLink:self.termsAndConditionsButton];
}

-(void)validateLogin{
    if([InformationAPI isLogged])
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
}

@end
