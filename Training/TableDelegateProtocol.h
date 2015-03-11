//
//  TableDelegateProtocol.h
//  Training
//
//  Created by María Eugenia Sakuda on 3/6/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//


#ifndef Training_TableDelegateProtocol_h
#define Training_TableDelegateProtocol_h
#include "NewsViewModel.h"

@protocol tableDelegate <NSObject>

- (void)showNew:(NewsViewModel *)nModel;

@end

#endif
