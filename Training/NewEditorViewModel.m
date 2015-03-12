//
//  NewEditorViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/6/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewEditorViewModel.h"
#import "UserRepository.h"
#import "NewModel.h"

@interface NewEditorViewModel ()

@property  UserRepository *repository;

@end

@implementation NewEditorViewModel

- (NewEditorViewModel *)init{
    self = [super init];
    if(self != nil)
        self.repository = [[UserRepository alloc] init];
    return self;
}

- (ValidationAnswerModel *)checkInformationTitle:(NSString *)title data:(NSString *)data{
    if(![self validateString:title] || ![self validateString:data]){
        return [[ValidationAnswerModel alloc] initWithErrorMsg:NSLocalizedString(@"Todos los campos son requeridos", nil)];
    }
    if(title.length > 60){
        return [[ValidationAnswerModel alloc] initWithErrorMsg:NSLocalizedString(@"El título puede tener hasta 60 caracteres",nil)];
    } else if(data.length > 250){
        return [[ValidationAnswerModel alloc] initWithErrorMsg:NSLocalizedString(@"La noticia puede tener hasta 250 caracteres", nil)];
    }
    return [[ValidationAnswerModel alloc] initPass];
}

- (void)createNewWithArray:(NSDictionary *)nArray success:(void (^)(void))successBlock fail:(void (^)(NSString *))failBlock{
    [self.repository createNewWithArray:nArray success:successBlock fail:failBlock];
}

- (BOOL)validateString:(NSString *)str{
    if(str.length == 0){
        return NO;
    }
    
    NSString *pattern = @"/.*\\S.*/";
    NSError *error = nil;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
    
    NSAssert(regex, @"Unable to create regular expression");
    
    NSRange textRange = NSMakeRange(0, str.length);
    NSRange matchRange = [regex rangeOfFirstMatchInString:str options:NSMatchingReportProgress range:textRange];
    
    // Did we find a matching range
    return !(matchRange.location != NSNotFound);
}

@end
