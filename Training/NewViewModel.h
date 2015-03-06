//
//  NewViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/5/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewModel.h"

@interface NewViewModel : NSObject

- (void)favoriteStateChangeSuccess:(void(^)(BOOL))successBlock failBlock:(void(^)(void))failBlock;
- (NewModel*)getNew;
- (NewViewModel*)initWithModel:(NewModel *)newModel;

@end
