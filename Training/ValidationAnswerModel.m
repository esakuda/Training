//
//  ValidationAnswerModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/4/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "ValidationAnswerModel.h"

@implementation ValidationAnswerModel

- (ValidationAnswerModel *)initWithErrorMsg:(NSString *)msg{
    self = [super init];
    if(self != nil){
        self.errorMsg = msg;
        self.pass = NO;
    }
    return self;
}

- (ValidationAnswerModel *)initPass{
    self = [super init];
    if(self != nil){
        self.pass = YES;
        self.errorMsg = nil;
    }
    return self;
}

@end
