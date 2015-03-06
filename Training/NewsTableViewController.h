//
//  NewsTableViewController.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableDelegateProtocol.h"

@interface NewsTableViewController : UITableViewController

@property id<tableDelegate> delegate;

@end



