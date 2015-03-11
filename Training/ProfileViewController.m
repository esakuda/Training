//
//  ProfileViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/20/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileViewModel.h"
#import "EXPhotoViewer.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITextView *profileDescriptionText;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileHeaderImageView;
@property (weak, nonatomic) IBOutlet UIButton *editIconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *locationIconImageView;
@property ProfileViewModel *viewModel;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ProfileViewModel alloc] init];
    [self setViewInformation];
}

- (void)setViewInformation{
    [self setViewStyle];
    [self chargeFunctionality];
}

-(void)tapImageDetected:(UIGestureRecognizer *)sender{
    UIImageView *image = ((UIImageView *)[sender view]);
    [EXPhotoViewer showImageFrom:image];
}

-(void)showElements:(BOOL)show{
    self.editIconImageView.hidden = !show;
    self.locationIconImageView.hidden = !show;
    self.locationLabel.hidden = !show;
    self.profileImageView.hidden = !show;
    self.profileHeaderImageView.hidden = !show;
    self.profileDescriptionText.hidden = !show;
    self.nameLabel.hidden = !show;
}

-(void)setViewStyle{
    self.navigationItem.hidesBackButton = YES;
    
    self.profileImageView.layer.cornerRadius = self.profileImageView.layer.frame.size.width/2;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.userInteractionEnabled = YES;
    self.profileHeaderImageView.userInteractionEnabled = YES;
}

-(void)chargeFunctionality{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    
    [self.profileHeaderImageView addGestureRecognizer:singleTap2];
    [self.profileImageView addGestureRecognizer:singleTap];
    
    [self.viewModel getProfileDataSuccessBlock:^(NSString *name, NSString *location, NSString *description, UIImage *profileImage, UIImage *headerImage){
        self.nameLabel.text = name;
        [self.nameLabel setTextColor: [UIColor blueColor]];
        
        self.locationLabel.text = location;
        [self.locationLabel setTextColor:[UIColor lightGrayColor]];
        
        self.profileDescriptionText.text = description;
        [self.profileHeaderImageView setImage:headerImage];
        [self.profileImageView setImage:profileImage];
    }
                                     failBlock:nil];
}

@end
