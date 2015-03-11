//
//  NewsViewModel.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/11/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewsViewModel.h"
#import "NSDate+TimeAgo.h"

@interface NewsViewModel()

@property NewModel *nModel;

@end

@implementation NewsViewModel

- (NewsViewModel *)initWithNew:(NewModel *)new{
    self = [super init];
    if(self != nil){
        self.nModel = new;
    }
    return self;
}

- (NSString *)getAuthorName{
    return self.nModel.authorName;
}

- (NSString *)getDescriptionLabel{
    return self.nModel.data;
}

- (NSString *)getTime{
    return self.nModel.time.timeAgoSimple;
}

- (UIImage *)getImage{
    return self.nModel.image;
}

- (BOOL)getFavorite{
    return self.nModel.favorite;
}

- (BOOL)favoriteStateChange{
    [self.nModel favoriteStateChange:!self.nModel.favorite];
    return self.nModel.favorite;
}

@end
