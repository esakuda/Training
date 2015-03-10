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
- (void)addUser:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock;
- (void)getUserDataSuccess:(void(^)(UserModel *))success failBlock:(void(^)(NSString *))failBlock;
- (void)favoriteStateChange:(unsigned long)newId success:(void(^)(BOOL))successBlock fail:(void(^)(void))failBlock;
- (void)createNewWithArray:(NSDictionary *)nArray success:(void (^)(void))successBlock fail:(void (^)(NSString *))failBlock;

@end
