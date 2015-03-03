//
//  FirstViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/20/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(id)sender {
    NSLog(@"segue a otra view");
}

@end
