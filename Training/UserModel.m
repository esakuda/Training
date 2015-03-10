//
//  UserModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (void)name:(NSString *)name location:(NSString *)location description:(NSString *)description profileImage:(NSString *)profileImage headerImage:(NSString *)headerImage{
    self.name = name;
    self.location = location;
    self.profileDescription = description;
    self.profileImage = [UIImage imageNamed:profileImage];
    self.news = [[NSMutableArray alloc] init];
    self.headerImage = [UIImage imageNamed:headerImage];
}

- (void)name:(NSString *)name location:(NSString *)location description:(NSString *)description profileImage:(NSString *)profileImage headerImage:(NSString *)headerImage news:(NSMutableArray *)news{
    [self name:name location:location description:description profileImage:profileImage headerImage:headerImage];
    self.news = news;
}

@end
