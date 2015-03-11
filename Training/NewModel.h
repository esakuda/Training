//
//  New.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NewModel : NSObject

@property NSString *authorName;
@property NSString *data;
@property NSDate *time;
@property UIImage *image;
@property BOOL favorite;

- (NewModel *)initWithArray:(NSDictionary *)newsData;

@end
