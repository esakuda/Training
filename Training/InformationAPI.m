//
//  Information.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "InformationAPI.h"

@interface InformationAPI()

@property NSMutableDictionary *userData;

@end

//Crear el singleton
@implementation InformationAPI

+(InformationAPI*)getData{
    static InformationAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
         _sharedInstance = [[InformationAPI alloc] init];
        [_sharedInstance initializeData];
    });
    return _sharedInstance;
}

+ (BOOL)isLogged{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"email"] != nil;
}

-(void)addUser:(NSString*)email addPassword:(NSString*)password{
    [self.userData setObject:password forKey:email];
}

-(void)initializeData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.userData = [defaults objectForKey:@"userData"];
    if (self.userData == nil){
        self.userData = [[NSMutableDictionary alloc] init];
        [self.userData setObject:@"prueba123" forKey:@"prueba123@wolox.com.ar"];
    }
}

- (void)userLogged:(NSString *)email{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults setObject:email forKey:@"email"];
}

- (void)logout{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"email"];
}

- (BOOL)chekCredentials:(NSString *)email password:(NSString *)password{
    return [[self.userData objectForKey:email] isEqualToString:password];
}

- (BOOL)isAvaiableEmail:(NSString *)email{
    return ![self.userData objectForKey:email];
}

@end
