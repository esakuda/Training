//
//  SignUpViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "SignUpViewModel.h"
#import "UserRepository.h"

@interface SignUpViewModel()

@property UserRepository *repository;

@end

@implementation SignUpViewModel

- (SignUpViewModel *)init{
    self = [super init];
    if(self != nil){
        self.repository = [[UserRepository alloc] init];
    }
    return self;
}

- (ValidationAnswerModel *)validateEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword{
    NSString *errorMsg = nil;
    if(!((email.length == 0) || (password.length == 0) || (confirmPassword.length == 0))){
        if([self isValidEmail:email]){
            if([password isEqualToString:confirmPassword]){
                //es válido
                return [[ValidationAnswerModel alloc] initPass];
            } else {
                errorMsg = NSLocalizedString(@"La confirmación de la contraseña no concuerda.", nil);
            }
        } else {
            errorMsg = NSLocalizedString(@"El email ingresado no es válido o ya se encuentra utilizado", nil);
        }
    } else {
        errorMsg = NSLocalizedString(@"Todos los campos son requeridos", nil);
    }
    
    return [[ValidationAnswerModel alloc] initWithErrorMsg:errorMsg];
}

- (void)addUser:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock{
    [self.repository addUser:email password:password successBlock:successBlock failBlock:failBlock];
}

@end
