//
//  InformationAPI.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/23/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "InformationAPI.h"
#import "NewModel.h"

@interface InformationAPI()

@property NSMutableDictionary *userData;
@property UserModel *user;

@end

//Crear el singleton
@implementation InformationAPI

+(InformationAPI*)getData{
    static InformationAPI *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
         _sharedInstance = [[InformationAPI alloc] init];
        [_sharedInstance initializeData];
        [_sharedInstance initializeUser];
    });
    return _sharedInstance;
}

-(void)addUser:(NSString*)email addPassword:(NSString*)password{
    [self.userData setObject:password forKey:email];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.userData forKey:@"userData"];
}

-(void)initializeData{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.userData = [defaults objectForKey:@"userData"];
    if (self.userData == nil){
        self.userData = [[NSMutableDictionary alloc] init];
        [self.userData setObject:@"prueba123" forKey:@"prueba123@wolox.com.ar"];
    }
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

- (UserModel *)getUser{
    return self.user;
}

- (void)favoriteStateChangeIndex:(unsigned long)index success:(void(^)(BOOL))successBlock fail:(void(^)(void))failBlock{
    BOOL favorite = [[self.user.news objectAtIndex:index] favoriteStateChange];
    NSLog(@"api");
    successBlock(favorite);
}

- (void)initializeUser{
    NSMutableArray *news = [[NSMutableArray alloc] init];
    
    for(unsigned long i = 0; i < 10 ; i++){
        NewModel *n1 = [[NewModel alloc] initWithArray:@{
                                                         @"authorName":@"Sakura",
                                                         @"time": [NSDate dateWithTimeInterval:10000 sinceDate:[NSDate date]],
                                                         @"text":[NSString stringWithFormat:@"%ld Mensaje de prueba", (unsigned long)i],
                                                         @"image":@"sakura.jpg",
                                                         @"newId":[NSNumber numberWithLong:i]
                                                         }];
        [news addObject:n1];
    }
    UserModel *user = [[UserModel alloc] init];
    [user name:@"Mario Trusso" location:@"Milano, Italy" description:@"prueba" profileImage:@"images.jpeg" headerImage:@"fondo.jpg" news:news];
    self.user = user;
}

@end
