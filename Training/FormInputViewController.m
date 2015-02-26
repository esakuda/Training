//
//  FormInputViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/24/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "FormInputViewController.h"
#import "InformationAPI.h"

@interface FormInputViewController ()

@end

@implementation FormInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

/*
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
        didValidate = [self specialValidation:email];
    
    return didValidate;
}

*/

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
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.wolox.com.ar"]];
    
}

@end
