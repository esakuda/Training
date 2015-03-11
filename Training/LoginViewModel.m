//
//  LoginModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "LoginViewModel.h"
#import "UserRepository.h"

@interface LoginViewModel ()

@property UserRepository *repository;

@end

@implementation LoginViewModel

- (LoginViewModel*)init{
    self = [super init];
    if(self != nil)
        self.repository = [[UserRepository alloc] init];
    return self;
}

- (void)chekCredentials:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock:(void(^)(NSString *))failBlock{
    if([self isValidEmail:email]){
        [self.repository chekCredentials:email password:password successBlock:^{NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                                                                                [defaults setObject:email forKey:@"email"];
                                                                                successBlock();}
                                                                    failBlock:failBlock];
    } else {
        failBlock(NSLocalizedString(@"Email o contraseña incorrectas", nil));
    }
}

- (BOOL)isLogged{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"email"] != nil)
        return YES;
    return NO;
}

@end
