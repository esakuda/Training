//
//  SignUpViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "FormViewModel.h"

@interface SignUpViewModel : FormViewModel

- (void)addUser:(NSString *)email password:(NSString *)password confirmPassword:(NSString *)confirmPassword successBlock:(void(^)(void))successBlock failBlock: (void(^)(NSString *))failBlock;

@end
