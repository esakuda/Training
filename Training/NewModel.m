//
//  New.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewModel.h"

@implementation NewModel

-(NewModel *)initWithArray:(NSDictionary *)newsData{
    self = [super init];
    if(self != nil){
        self.authorName = newsData[@"authorName"];
        self.time = newsData[@"time"];
        self.favorite = NO;
        self.data = newsData[@"text"];
        self.image = [UIImage imageNamed:newsData[@"image"]];
    }
    return self;
}

- (BOOL)favoriteStateChange{
    self.favorite = !self.favorite;
    return self.favorite;
}

- (NSString*)timeToString{
    NSString *timeLeft;
    
    NSInteger seconds = [[NSDate date] timeIntervalSinceDate:self.time];
    
    NSInteger days = (int) (floor(seconds / (3600 * 24)));
    if(days) seconds -= days * 3600 * 24;
    
    NSInteger hours = (int) (floor(seconds / 3600));
    if(hours) seconds -= hours * 3600;
    
    NSInteger minutes = (int) (floor(seconds / 60));
    if(minutes) seconds -= minutes * 60;
    
    if(days) {
        timeLeft = [NSString stringWithFormat:@"%ld Days", (long)days*-1];
    }
    else if(hours) { timeLeft = [NSString stringWithFormat: @"%ldh", (long)hours*-1];
    }
    else if(minutes) { timeLeft = [NSString stringWithFormat: @"%ldm", (long)minutes*-1];
    }
    else if(seconds)
        timeLeft = [NSString stringWithFormat: @"%lds", (long)seconds*-1];
    
    return timeLeft;
}

@end
