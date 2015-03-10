//
//  UserModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UserModel : NSObject

@property  NSString *name;
@property  NSString *location;
@property  NSString *profileDescription;
@property  NSMutableArray *news;
@property  UIImage *profileImage;
@property  UIImage *headerImage;

- (void)name:(NSString *)name location:(NSString *)location description:(NSString *)description profileImage:(NSString *)profileImage headerImage:(NSString *)headerImage;

- (void)name:(NSString *)name location:(NSString *)location description:(NSString *)description profileImage:(NSString *)profileImage headerImage:(NSString *)headerImage news:(NSMutableArray *)news;

@end
