//
//  UserRepository.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface UserRepository : NSObject

- (void)chekCredentials:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock:(void(^)(NSString *))failBlock;
-(void)isLogged:(void(^)(void))successBlock;
- (void)addUser:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock;
- (void)getProfileDataSuccess:(void(^)(UserModel *))success failBlock:(void(^)(NSString *))failBlock;

@end
