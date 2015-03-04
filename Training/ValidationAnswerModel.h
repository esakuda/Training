//
//  ValidationAnswerModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/4/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ValidationAnswerModel : NSObject

@property NSString *errorMsg;
@property BOOL pass;

- (ValidationAnswerModel *)initPass;
- (ValidationAnswerModel *)initWithErrorMsg:(NSString *)msg;

@end
