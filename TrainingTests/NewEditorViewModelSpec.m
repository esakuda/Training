//
//  NewEditorViewModelSpec.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/12/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//


#import <Specta/Specta.h> // #import "Specta.h" if you're using libSpecta.a
#import "NewEditorViewModel.h"
#import <Expecta/Expecta.h>
#import "ValidationAnswerModel.h"

SpecBegin(NewEditorViewModel)

describe(@"NewEditorViewModel", ^{
    
    __block NewEditorViewModel *newEditorViewModel = nil;
    __block NSDictionary *titlesDictionary = nil;
    __block NSDictionary *newsDictionary = nil;
    __block ValidationAnswerModel *ans = nil;
    
    beforeAll(^{
        newEditorViewModel = [[NewEditorViewModel alloc] init];
        titlesDictionary = @{ @"valid title": @"test title",
                              @"indalid title: top limit": @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                              @"invalid title: empty": @"",
                              @"invalid title: spaces": @"   "
                              };
        newsDictionary = @{ @"valid new": @"test new",
                            @"indalid new: top limit": @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaáaaáadadfasfasfasdfadsfffffffffffffffffffffffffffffffffffffffañlsfhalsdjkfhasdjkfhasdklfjahsdlfjkhsfklajsdfhajklsfhaljksdfhaklsdjfhalskdjfhalsdjfkklajsfhakljsfhaksjlfhalkjsfhalkjsfhalkjs",
                            @"invalid new: empty": @"",
                            @"invalid new: spaces": @"   "
                              };
    });
    
    describe(@"Validation informatión", ^{
        it(@"should validate", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[@"valid title"] data:newsDictionary[@"valid new"]].pass).to.equal(YES);
        });
        it(@"should not validate long title", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[@"indalid title: top limit"] data:newsDictionary[@"valid new"]].errorMsg).to.equal(@"Title limit is up to 60 characters");
        });
        it(@"should not validate long new", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[@"valid title"] data:newsDictionary[@"indalid new: top limit"]].errorMsg).to.equal(@"New limit is up to 250 characters");
        });
        it(@"should not validate title empty", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[@"invalid title: empty"] data:newsDictionary[@"valid new"]].errorMsg).to.equal(@"All fields are requiered");
        });
        it(@"should not validate new empty", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[@"valid title"] data:newsDictionary[@"invalid new: empty"]].errorMsg).to.equal(@"All fields are requiered");
        });
        it(@"should not validate title spaces", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[ @"invalid title: spaces"] data:newsDictionary[@"valid new"]].errorMsg).to.equal(@"All fields are requiered");
        });
        it(@"should not validate new spaces", ^{
            expect([newEditorViewModel checkInformationTitle:titlesDictionary[@"valid title"] data:newsDictionary[ @"invalid new: spaces"]].errorMsg).to.equal(@"All fields are requiered");
        });
    });
});

SpecEnd