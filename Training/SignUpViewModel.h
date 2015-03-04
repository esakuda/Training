//
//  SignUpViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "FormViewModel.h"
#import "ValidationAnswerModel.h"

@interface SignUpViewModel : FormViewModel

- (void)addUser:(NSString *)email password:(NSString *)password successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock;
- (ValidationAnswerModel *)validateEmail:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword;

@end
