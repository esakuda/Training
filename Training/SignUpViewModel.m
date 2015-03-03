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

-(SignUpViewModel *)init{
    self = [super init];
    self.repository = [[UserRepository alloc] init];
    return self;
}

-(BOOL)validateEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword failBlock: (void(^)(NSString *))failBlock{
    NSString *errorMsg = nil;
    if(!((email.length == 0) || (password.length == 0) || (confirmPassword.length == 0))){
        if([self isValidEmail:email]){
            if([password isEqualToString:confirmPassword]){
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
    
    failBlock(errorMsg);
    return NO;
}

- (void)addUser:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock{
    if([self validateEmail:email password:password confirmPassword:confirmPassword failBlock:failBlock]){
        [self.repository addUser:email password:password successBlock:successBlock failBlock:failBlock];
    }
}

@end
