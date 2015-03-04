//
//  UserModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (UserModel *)initWithDictionary:(NSDictionary *)userDictionary{
    self = [super init];
    if(self != nil){
        self.name = userDictionary[@"name"];
        self.location = userDictionary[@"location"];
        self.profileDescription = userDictionary[@"description"];
        self.profileImage = [UIImage imageNamed:userDictionary[@"profileImage"]];
        self.news = [[NSMutableArray alloc] init];
        self.headerImage = [UIImage imageNamed:userDictionary[@"headerImage"]];
    }
    return self;
}

@end
