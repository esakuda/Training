//
//  Information.h
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationAPI : NSObject

+(InformationAPI*)getData;
+(BOOL)isLogged;

-(void)addUser:(NSString*)email addPassword:(NSString*)password;
-(void)userLogged;
-(void)logout;
-(BOOL)isAvaiableEmail:(NSString *)email;
-(BOOL)chekCredentials:(NSString *)email password:(NSString *)password;

@end
