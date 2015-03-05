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
#import "NewsViewModel.h"


@interface NewsTableViewModel : NSObject

- (long)newsCount;
- (NewsViewModel *)objectAtIndex:(unsigned long)index;
- (BOOL)favoriteStateChange:(unsigned long)inde;

@end
