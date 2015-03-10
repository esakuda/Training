//
//  NewEditorViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/6/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ValidationAnswerModel.h"

@interface NewEditorViewModel : NSObject

- (ValidationAnswerModel *)checkInformationTitle:(NSString *)title data:(NSString *)data;
- (void)createNewWithArray:(NSDictionary *)nArray success:(void(^)(void))successBlock fail:(void(^)(NSString *))failBlock;

@end
