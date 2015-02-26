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
//@property (weak, nonatomic) IBOutlet UILabel *termsAndConditionsLabel;
@property (weak, nonatomic) IBOutlet TTTAttributedLabel *termsAndConditionsLabel;
@property (weak, nonatomic) IBOutlet UIButton *termsAndConditionsButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;



@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self hideElements];
    [self.view makeToastActivity];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"email"]){
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
    }
    
    [self.view hideToastActivity];
    [self showElements];
    
    [self.loginButton.layer setBorderWidth:1.0f];
    [self.loginButton.layer setBorderColor:[UIColor blackColor].CGColor];
    
    //Hypervínculos label
    //[self setLabel];
    
    [self setButtonAsLabelLink:self.termsAndConditionsButton];
    
    //Is pendent to check if it's already logged
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
}*/


- (IBAction)login:(id)sender {
    NSString *toastMessage = @"";
    
    if(![self isValidEmail: self.emailText.text]){
        toastMessage = @"Email no válido";
    } else {
        NSString *realPassword = [[InformationAPI getData].userData objectForKey:self.emailText.text];
        if (![realPassword isEqualToString:self.passwordText.text])
            toastMessage = @"La contraseña no es válida";
    }

    if([toastMessage isEqualToString:@""]){
        [self persistUserData];
        [self performSegueWithIdentifier:@"tabBarSegue" sender:self];
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.view makeToast:toastMessage];
    });
   
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
    if ((matchRange.location != NSNotFound) &&
        [[InformationAPI getData].userData objectForKey:email])
        didValidate = YES;

    return didValidate;
}
-(BOOL)specialValidation:(NSString *)email{
    return [[InformationAPI getData].userData objectForKey:email];
}

//Se puede hacer directamente y no por código
- (IBAction)passwordChange:(id)sender {
    self.passwordText.secureTextEntry = YES;
}

-(void)persistUserData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:self.emailText.text forKey:@"email"];
    [defaults setObject:self.passwordText.text forKey:@"password"];
    
    [defaults synchronize];
}

-(void)hideElements{
    self.signUpButton.hidden = YES;
    self.loginButton.hidden = YES;
    self.emailText.hidden = YES;
    self.passwordText.hidden = YES;
    self.termsAndConditionsButton.hidden = YES;
    self.termsAndConditionsLabel.hidden = YES;
}

-(void)showElements{
    self.signUpButton.hidden = NO;
    self.loginButton.hidden = NO;
    self.emailText.hidden = NO;
    self.passwordText.hidden = NO;
    self.termsAndConditionsButton.hidden = NO;
    self.termsAndConditionsLabel.hidden = NO;
}


@end
