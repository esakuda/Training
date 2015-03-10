//
//  NewsTableViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewsTableViewModel.h"
#import "UserRepository.h"
#import "NewModel.h"
#import "NSDate+TimeAgo.h"

@interface NewsTableViewModel()

@property UserRepository *repository;
@property NSMutableArray *news;

@end

@implementation NewsTableViewModel

-(NewsTableViewModel *)init{
    self = [super init];
    if (self != nil){
        self.repository = [[UserRepository alloc] init];
    }
    return self;
}

- (long)newsCount{
    return [self.news count];
}

- (NewModel *)objectAtIndex:(unsigned long)index{
    return [self.news objectAtIndex:index];
}

- (void)getAllNewsSuccess:(void(^)(void))successBlock fail:(void(^)(NSString*))failBlock{
    [self.repository getUserDataSuccess:^(UserModel *user){
        self.news = user.news;
        if(self.news != nil && [self.news count]){
            successBlock();
        } else {
            failBlock(@"No hay noticias para mostrar");
        }
    }
                              failBlock:failBlock];
}

- (BOOL)favoriteStateChange:(unsigned long)index{
    return [[self.news objectAtIndex:index] favoriteStateChange];
}

- (NSString *)getAuthorNameIndex:(unsigned long)index{
    return ((NewModel*)[self.news objectAtIndex:index]).authorName;
}

- (NSString *)getDescriptionLabelIndex:(unsigned long)index{
    return ((NewModel*)[self.news objectAtIndex:index]).data;
}

- (NSString *)getTimeIndex:(unsigned long)index{
    return ((NewModel*)[self.news objectAtIndex:index]).time.timeAgoSimple;
}

- (UIImage *)getImageIndex:(unsigned long)index{
    return ((NewModel*)[self.news objectAtIndex:index]).image;
}

- (BOOL)getFavoriteIndex:(unsigned long)index{
    return ((NewModel*)[self.news objectAtIndex:index]).favorite;
}

@end
