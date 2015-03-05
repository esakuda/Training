//
//  PostViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/5/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *dataTextViewer;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteImageViewr;

@end

@implementation PostViewController

@synthesize nModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self chargeData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)chargeData{
    self.headerImageView.image = self.nModel.image;
    self.nameLabel.text = self.nModel.authorName;
    self.timeLabel.text = [self.nModel timeToString];
    self.dataTextViewer.text = self.nModel.data;
    if(self.nModel.favorite){
        self.favoriteImageViewr.image = [UIImage imageNamed:@"i-like-active.png"];
    }
}

@end
