//
//  NewsViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/11/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NewModel.h"

@interface NewsViewModel : NSObject

- (NewsViewModel *)initWithNew:(NewModel *)new;
- (NSString *)getAuthorName;
- (NSString *)getDescriptionLabel;
- (NSString *)getTime;
- (UIImage *)getImage;
- (BOOL)getFavorite;
- (BOOL)favoriteStateChange;
- (UIImage *)favoriteImage;

@end
