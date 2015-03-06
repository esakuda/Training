//
//  NewViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/5/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewViewModel.h"
#import "NewModel.h"
#import "UserRepository.h"

@interface NewViewModel ()

@property UserRepository *repository;
@property NewModel *nModel;

@end

@implementation NewViewModel

- (NewViewModel*)initWithModel:(NewModel*)nModel{
    self = [super init];
    if(self != nil){
        self.repository = [[UserRepository alloc] init];
        self.nModel = nModel;
    }
    return self;
}

- (void)favoriteStateChangeSuccess:(void(^)(BOOL))successBlock failBlock:(void(^)(void))failBlock{
    
    
    NSLog(@"view Model");
    [self.repository favoriteStateChange:self.nModel.newId success:successBlock fail:failBlock];
}

- (NewModel*)getNew{
    return self.nModel;
}

@end
