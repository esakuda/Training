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
@property NSMutableArray *newsViewModel;

@end

@implementation NewsTableViewModel

- (NewsTableViewModel *)init{
    self = [super init];
    if (self != nil){
        self.repository = [[UserRepository alloc] init];
    }
    return self;
}

- (long)newsCount{
    return [self.newsViewModel count];
}

- (NewsViewModel *)objectAtIndex:(unsigned long)index{
    return [self.newsViewModel objectAtIndex:index];
}

- (void)getAllNewsSuccess:(void(^)(void))successBlock fail:(void(^)(NSString*))failBlock{
    [self.repository getUserDataSuccess:^(UserModel *user){
        [self initNews:user.news];
        if(self.newsViewModel != nil && [self.newsViewModel count]){
            successBlock();
        } else {
            failBlock(NSLocalizedString(@"No hay noticias para mostrar", nil));
        }
    }
                              failBlock:failBlock];
}

- (void)initNews:(NSMutableArray *)news{
    self.newsViewModel = [[NSMutableArray alloc] init];
    for(int i = 0; i < [news count]; i++){
        [self.newsViewModel addObject:[[NewsViewModel alloc]initWithNew:[news objectAtIndex:i]]];
    }
}

@end
