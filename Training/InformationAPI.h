//
//  Information.h
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface InformationAPI : NSObject

+(InformationAPI*)getData;

-(void)addUser:(NSString*)email addPassword:(NSString*)password;
-(void)userLogged:(NSString *)email;
-(void)logout;
-(BOOL)isAvaiableEmail:(NSString *)email;
-(BOOL)chekCredentials:(NSString *)email password:(NSString *)password;
-(UserModel *)getUser;

@end
