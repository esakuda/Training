//
//  UserRepository.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "UserRepository.h"
#import "InformationAPI.h"
#import "ValidationAnswerModel.h"

@implementation UserRepository

- (void)chekCredentials:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock:(void(^)(NSString *))failBlock{
    if([[InformationAPI getData] chekCredentials:email password:password]){
        successBlock();
    } else {
        failBlock(NSLocalizedString(@"Wrong email or password", nil));
    }
}

- (void)isLogged:(void(^)(void))successBlock{
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
        failBlock(NSLocalizedString(@"This email is not aviable", nil));
    }
}

- (void)getUserDataSuccess:(void(^)(UserModel *))success failBlock:(void(^)(NSString *))failBlock{
    success([[InformationAPI getData] getUser]);
}

- (void)favoriteStateChange:(unsigned long)index success:(void(^)(BOOL))successBlock fail:(void(^)(void))failBlock{
    [[InformationAPI getData] favoriteStateChangeIndex:index success:successBlock fail:failBlock];
}

- (void)createNewWithArray:(NSDictionary *)nArray success:(void (^)(void))successBlock fail:(void (^)(NSString *))failBlock{
    ValidationAnswerModel* ans = [[InformationAPI getData] createNewWithArray:nArray];
    if(ans.pass){
        successBlock();
    } else {
        failBlock(ans.errorMsg);
    }
}

@end
