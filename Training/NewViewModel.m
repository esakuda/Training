//
//  NewViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/5/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewViewModel.h"
#import "NewsViewModel.h"
#import "NewModel.h"
#import "UserRepository.h"

@interface NewViewModel ()

@property UserRepository *repository;
@property NewsViewModel *nModel;

@end

@implementation NewViewModel

- (NewViewModel*)initWithModel:(NewsViewModel*)nModel{
    self = [super init];
    if(self != nil){
        self.repository = [[UserRepository alloc] init];
        self.nModel = nModel;
    }
    return self;
}

- (void)favoriteStateChangeSuccess:(void(^)(BOOL))successBlock failBlock:(void(^)(void))failBlock{
    [self.repository favoriteStateChange:[self.nModel getId] success:successBlock fail:failBlock];
}

- (NewsViewModel*)getNew{
    return self.nModel;
}

@end
