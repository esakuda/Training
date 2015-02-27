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

@interface SignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordField;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsButton;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setButtonAsLabelLink:self.termsAndConditionsButton];
    // Do any additional setup after loading the view.
}

- (IBAction)joinPressed:(id)sender {
    if([self dataValidate]){
        [[InformationAPI getData]addUser:self.emailField.text addPassword: self.passwordField.text];
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
    }
}

//Arreglar esto!!
-(BOOL)dataValidate{
    NSString *errorMsg = nil;
    if(!((self.emailField.text.length == 0) || (self.passwordField.text.length == 0) || (self.confirmPasswordField.text.length == 0))){
        if([self isValidEmail:self.emailField.text]){
            if([self.passwordField.text isEqualToString:self.confirmPasswordField.text]){
                //es válido
                return YES;
            } else {
                errorMsg = @"La confirmación de la contraseña no concuerda.";
            }
        } else {
            errorMsg = @"El email ingresado no es válido o ya se encuentra utilizado";
        }
    } else {
        errorMsg = @"Todos los campos son requeridos";
    }
    
    [self.view makeToast:errorMsg];
    return NO;
}

- (BOOL)isValidEmail:(NSString *)email{
    return [super isValidEmail:email] && [self specialValidate:email];
}

-(BOOL)specialValidate:(NSString*)email{
    return ![[InformationAPI getData] isAvaiableEmail:email];
}

@end
