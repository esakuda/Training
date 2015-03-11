//
//  NewViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/5/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsViewModel.h"

@interface NewViewModel : NSObject

- (void)favoriteStateChangeSuccess:(void(^)(BOOL))successBlock failBlock:(void(^)(void))failBlock;
- (NewsViewModel*)getNew;
- (NewViewModel*)initWithModel:(NewsViewModel *)newsViewModel;

@end
