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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)joinPressed:(id)sender {
    if([self dataValidate]){
        [[InformationAPI getData]addUser:self.emailField.text addPassword: self.passwordField.text];
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
    } else {
        [self.view makeToast:@"la información no es válida"];
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
    
    NSString *pattern = @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, email.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:email options:NSMatchingReportProgress range:textRange];
    
    BOOL didValidate = NO;
    
    // Did we find a matching range
    if (matchRange.location != NSNotFound)
        if (![[InformationAPI getData].userData objectForKey:email]) //El toast de la validación debería saltar acá o en el otro método.
            didValidate = YES;
    
    return didValidate;
}

-(BOOL)specialValidate:(NSString*)email{
    return ![[InformationAPI getData].userData objectForKey:email];
}

@end
