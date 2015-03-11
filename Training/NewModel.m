//
//  New.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewModel.h"

@implementation NewModel

- (NewModel *)initWithArray:(NSDictionary *)newsData{
    self = [super init];
    if(self != nil){
        self.authorName = newsData[@"authorName"];
        self.time = newsData[@"time"];
        self.favorite = NO;
        self.data = newsData[@"text"];
        self.image = [UIImage imageNamed:newsData[@"image"]];
        self.newId = [(NSNumber *)newsData[@"newId"] longValue];
    }
    return self;
}

@end
