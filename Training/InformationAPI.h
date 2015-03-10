//
//  InformationAPI.h
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface InformationAPI : NSObject

+(InformationAPI*)getData;

- (void)addUser:(NSString*)email addPassword:(NSString*)password;
- (void)logout;
- (BOOL)isAvaiableEmail:(NSString *)email;
- (BOOL)chekCredentials:(NSString *)email password:(NSString *)password;
- (UserModel *)getUser;
- (void)favoriteStateChangeIndex:(unsigned long)index success:(void(^)(BOOL))successBlock fail:(void(^)(void))failBlock;
- (BOOL)createNewWithArray:(NSDictionary *)nArray;

@end
