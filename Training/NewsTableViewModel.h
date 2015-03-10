//
//  NewsTableViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewModel.h"

@interface NewsTableViewModel : NSObject

- (long)newsCount;
- (NewModel *)objectAtIndex:(unsigned long)index;
- (void)getAllNewsSuccess:(void(^)(void))successBlock fail:(void(^)(NSString*))failBlock;
- (BOOL)favoriteStateChange:(unsigned long)inde;

@end
