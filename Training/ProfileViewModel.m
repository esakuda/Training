//
//  ProfileViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "ProfileViewModel.h"
#import "UserRepository.h"
#import "UserModel.h"

@interface ProfileViewModel()

@property UserRepository *repository;

@end

@implementation ProfileViewModel

-(ProfileViewModel *)init{
    self = [super init];
    if(self != nil){
        self.repository = [[UserRepository alloc] init];
    }
    return self;
}

-(void)getProfileDataSuccessBlock:(void(^)(NSString*, NSString*, NSString*, UIImage *, UIImage *))success failBlock:(void(^)(NSString*))failBlock{
    [self.repository getUserDataSuccess:^(UserModel *userModel){
                                                success(userModel.name, userModel.location, userModel.profileDescription, userModel.profileImage, userModel.headerImage);}
                                 failBlock:failBlock];
}

@end
