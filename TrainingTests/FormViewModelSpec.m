//
//  FormViewModelTest.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/12/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Specta/Specta.h> // #import "Specta.h" if you're using libSpecta.a
#import "FormViewModel.h"
#import <Expecta/Expecta.h>

SpecBegin(FormViewModel)

describe(@"FormViewModel", ^{
    
    __block FormViewModel *formViewModel = nil;
    __block NSDictionary *emailsDictionary = nil;
    
    beforeAll(^{
        formViewModel = [[FormViewModel alloc] init];
        emailsDictionary = @{ @"rigth email: long": @"test@a.as.as",
                               @"rigth email: short": @"test@as.as",
                               @"wrong email: no @": @"test.a",
                               @"wrong email: no .": @"test@as",
                               @"wrong email: only one .": @"test@as.",
                               @"wrong email: only @": @"@",
                               @"wrong email: no name": @"@a.a",
                              };
    });
    
    describe(@"Validation", ^{
        it(@"should validate long", ^{
            expect([formViewModel isValidEmail:emailsDictionary[@"rigth email: long"]]).to.equal(YES);
        });
        
        it(@"should validate short", ^{
            expect([formViewModel isValidEmail:emailsDictionary[@"rigth email: short"]]).to.equal(YES);
        });
        
        it(@"should  not validate no @", ^{
            expect([formViewModel isValidEmail:emailsDictionary[@"wrong email: no @"]]).to.equal(NO);
        });
        
        it(@"should not validate no .", ^{
            expect([formViewModel isValidEmail:emailsDictionary[ @"wrong email: no ."]]).to.equal(NO);
        });
        
        it(@"should not validate only one .", ^{
            expect([formViewModel isValidEmail:emailsDictionary[@"wrong email: only one ."]]).to.equal(NO);
        });

        it(@"should not validate only @", ^{
            expect([formViewModel isValidEmail:emailsDictionary[@"wrong email: only @"]]).to.equal(NO);
        });

        it(@"should not validate no name", ^{
            expect([formViewModel isValidEmail:emailsDictionary[@"wrong email: no name"]]).to.equal(NO);
        });
    });
});

SpecEnd
