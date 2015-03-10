//
//  FirstViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/20/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addButton;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    self.addButton.layer.cornerRadius = self.addButton.layer.frame.size.width/2;
    self.addButton.clipsToBounds = YES;
}

- (IBAction)addButton:(id)sender {
    NSLog(@"segue a otra view");
}

@end
