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

- (NewsViewModel *)objectAtIndex:(unsigned long)index{
    return [self.news objectAtIndex:index];
}

- (void)getAllNewsSuccess:(void(^)(void))successBlock fail:(void(^)(NSString*))failBlock{
    [self.repository getUserDataSuccess:^(UserModel *user){
        [self initNews:user.news];
        if(self.news != nil && [self.news count]){
            successBlock();
        } else {
            failBlock(@"No hay noticias para mostrar");
        }
    }
                              failBlock:failBlock];
}

- (BOOL)favoriteStateChange:(unsigned long)index{
    NewsViewModel *new = [self.news objectAtIndex:index];
    return[new favoriteStateChange];
}

- (void)initNews:(NSMutableArray *)news{
    self.news = [[NSMutableArray alloc] init];
    for(int i = 0; i < [news count]; i++){
        [self.news addObject:[[NewsViewModel alloc]initWithNew:[news objectAtIndex:i]]];
    }
}

@end
