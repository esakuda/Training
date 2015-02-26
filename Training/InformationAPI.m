//
//  Information.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "InformationAPI.h"

@interface InformationAPI()

@end

//Crear el singleton
@implementation InformationAPI

+(InformationAPI*)getData{
    static InformationAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
         _sharedInstance = [[InformationAPI alloc] init];
        [_sharedInstance initializeData ];
    });
    return _sharedInstance;
}

-(void)addUser:(NSString*)email addPassword:(NSString*)password{
    [self.userData setObject:password forKey:email];
    [self persistData]; //No debería hacerse así
}

-(void)persistData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.userData forKey:@"userData"];
    [defaults synchronize];
}

-(void)initializeData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.userData = [defaults objectForKey:@"userData"];
    if (self.userData == nil){
        self.userData = [[NSMutableDictionary alloc]init];
        [self.userData setObject:@"prueba123" forKey:@"prueba123@wolox.com.ar"];
    }
}

@end
