//
//  SecondViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/20/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.profileImageView.layer.cornerRadius = self.profileImageView.layer.frame.size.width/2;
    self.profileImageView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
