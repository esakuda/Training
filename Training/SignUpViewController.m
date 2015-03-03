//
//  SignUpViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "SignUpViewController.h"
#import "UIView+Toast.h"
#import "InformationAPI.h"
#import "SignUpViewModel.h"

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsButton;
@property SignUpViewModel* viewModel;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setButtonAsLabelLink:self.termsAndConditionsButton];
    self.viewModel = [[SignUpViewModel alloc] init];
}

- (IBAction)joinPressed:(id)sender {
    void(^successBlock)(void) = ^{[self performSegueWithIdentifier:@"tabBarSegue" sender:self];};
    void(^failBlock)(NSString*) = ^(NSString *errorMsg){ [self.view makeToast:errorMsg]; };
    [self.viewModel addUser:self.emailField.text
                   password:self.passwordField.text
            confirmPassword:self.confirmPasswordField.text
               successBlock:successBlock
                  failBlock: failBlock];
}


@end
