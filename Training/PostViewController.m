//
//  PostViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/5/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "PostViewController.h"
#import "NewViewModel.h"
#import "NewsViewModel.h"
#import "NewModel.h"
#import "UIView+Toast.h"

@interface PostViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UITextView *dataTextViewer;
@property (weak, nonatomic) IBOutlet UIImageView *favoriteImageViewr;
@property NewViewModel *viewModel;

@end

@implementation PostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = NSLocalizedString(@"Post", nil);
    [self chargeData];
    [self setfavoriteImageViewAspect];

- (void)chargeData{
    NewsViewModel *nModel = [self.viewModel getNew];
    self.headerImageView.image = [nModel getImage];
    self.nameLabel.text = [nModel getAuthorName];
    self.timeLabel.text = [nModel getTime];
    self.dataTextViewer.text = [nModel getDescriptionLabel];
    self.favoriteImageViewr.image = [nModel favoriteImage];
}

- (void)tapImageDetected:(UIGestureRecognizer *)sender{
    [self.viewModel favoriteStateChangeSuccess:^(BOOL favorite){    if(favorite){
                                                                        ((UIImageView *)[sender view]).image = [UIImage imageNamed:@"i-like-active.png"];
                                                                    } else {
                                                                        ((UIImageView *)[sender view]).image = [UIImage imageNamed:@"i-like-inactive.png"];
                                                                    }
                                                                }
                                     failBlock:^{
                                            [self.view makeToast:@"No hay conección disponible"];
                                        }];
}

- (void)defineViewModel:(NewViewModel *)newViewModel{
    if(self != nil)
        self.viewModel = newViewModel;
}

- (void)setfavoriteImageViewAspect{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    [self.favoriteImageViewr addGestureRecognizer:singleTap];
    self.favoriteImageViewr.userInteractionEnabled = YES;
}

- (void)tapImageDetected:(UIGestureRecognizer *)sender{
    NSLog(@"tap");
    [self.viewModel favoriteStateChangeSuccess:^(BOOL favorite){    if(favorite){
                                                                        ((UIImageView *)[sender view]).image = [UIImage imageNamed:@"i-like-active.png"];
                                                                    } else {
                                                                        ((UIImageView *)[sender view]).image = [UIImage imageNamed:@"i-like-inactive.png"];
                                                                    }
                                                                }
                                     failBlock:^{
                                            [self.view makeToast:NSLocalizedString(@"No hay conección disponible", nil)];
                                        }];
}

- (void)defineViewModel:(NewViewModel *)newViewModel{
    if(self != nil)
        self.viewModel = newViewModel;
}

- (void)setfavoriteImageViewAspect{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    [self.favoriteImageViewr addGestureRecognizer:singleTap];
    self.favoriteImageViewr.userInteractionEnabled = YES;
}

@end
