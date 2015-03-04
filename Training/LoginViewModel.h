//
//  LoginModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FormViewModel.h"

@interface LoginViewModel : FormViewModel

- (void)chekCredentials:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock:(void(^)(NSString *))failBlock;
- (BOOL)isLogged;

@end
