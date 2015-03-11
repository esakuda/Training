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
#import "LoginViewModel.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *termsAndConditionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property LoginViewModel *viewModel;

@end

@implementation LoginViewController

- (LoginViewController*)init{
    self = [super init];
    if(self != nil){
        self.viewModel = [[LoginViewModel alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[LoginViewModel alloc] init];
    
    [self showElements:NO];
    [self.view makeToastActivity];
    
    [self validateLogin];
    
    [self.view hideToastActivity];
    [self showElements:YES];
    
    [self viewConfiguration];
}

- (IBAction)login:(id)sender {
    LoginViewController * __weak weakSelf = self;
    
    [self.viewModel chekCredentials:self.emailText.text
                           password:self.passwordText.text
                       successBlock:^{[weakSelf performSegueWithIdentifier:@"tabBarSegue" sender:self];}
                          failBlock:^(NSString * errorMsg){
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [self.view makeToast:errorMsg];
                                        });
                                    }];
}

- (void)showElements:(BOOL)show{
    self.signUpButton.hidden = !show;
    self.loginButton.hidden = !show;
    self.emailText.hidden = !show;
    self.passwordText.hidden = !show;
    self.termsAndConditionsButton.hidden = !show;
    self.termsAndConditionsLabel.hidden = !show;
}

-(void)viewConfiguration{
    [self.loginButton.layer setBorderWidth:1.0f];
    [self.loginButton.layer setBorderColor:[UIColor blackColor].CGColor];
    
    [self setButtonAsLabelLink:self.termsAndConditionsButton];
}

-(void)validateLogin{
    if([self.viewModel isLogged]){
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
    }
}

@end
