//
//  ProfileViewModelSpec.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/12/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Specta/Specta.h> // #import "Specta.h" if you're using libSpecta.a
#import "ProfileViewModel.h"
#import <Expecta/Expecta.h>

SpecBegin(ProfileViewModel)

describe(@"ProfileViewModel", ^{
    
    __block ProfileViewModel *profileViewModel = nil;
    
    beforeAll(^{
        profileViewModel = [[ProfileViewModel alloc] init];
    });
    
    describe(@"Get User Data Success", ^{
        [profileViewModel getProfileDataSuccessBlock:^(NSString *name, NSString *location, NSString *description, UIImage *profileImage, UIImage *headerImage){
                                                        it(@"check name", ^{
                                                            expect(name).to.equal(@"Mario Trusso");
                                                        });
                                                        it(@"check location", ^{
                                                            expect(location).to.equal(@"Milano, Italy");
                                                        });
                                                        it(@"check description", ^{
                                                            expect(description).to.equal(@"prueba");
                                                        });
                                                        it(@"check profile image", ^{
                                                            expect(profileImage).to.equal([UIImage imageNamed:@"images.jpeg"]);
                                                        });
                                                        it(@"check header image", ^{
                                                            expect(headerImage).to.equal([UIImage imageNamed:@"fondo.jpg"]);
                                                        });
                                                    }
                                           failBlock:nil];
    });
});

SpecEnd
