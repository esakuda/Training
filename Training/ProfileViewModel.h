//
//  ProfileViewModel.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ProfileViewModel : NSObject

- (void)getProfileDataSuccessBlock:(void(^)(NSString*, NSString*, NSString*, UIImage *, UIImage *))success failBlock:(void(^)(NSString*))failBlock;

@end
