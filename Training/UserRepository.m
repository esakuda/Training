//
//  UserRepository.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "UserRepository.h"
#import "InformationAPI.h"

@implementation UserRepository

-(void)getUserData{
    
}

//En la vida real debería ser asincrónico
- (void)chekCredentials:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock:(void(^)(NSString *))failBlock{
    if([[InformationAPI getData] chekCredentials:email password:password]){
        successBlock();
    } else {
        failBlock(@"Email o contraseña incorrectas");
    }
}

-(void)isLogged:(void(^)(void))successBlock{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"email"] != nil){
        successBlock();
    }
}

- (void)addUser:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock{
    if([[InformationAPI getData] isAvaiableEmail:email]){
        [[InformationAPI getData] addUser:email addPassword:password];
        successBlock();
    } else {
        failBlock(@"El mail solicitado no se encuentra disponible");
    }
}

- (void)getProfileDataSuccess:(void(^)(UserModel *))success failBlock:(void(^)(NSString *))failBlock{
    success([[InformationAPI getData] getUser]);
}



@end