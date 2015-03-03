//
//  SecondViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/20/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "SecondViewController.h"
#import "ProfileViewModel.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UITextView *profileDescriptionText;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileHeaderImageView;
@property (weak, nonatomic) IBOutlet UIButton *editIconImageView;
@property (weak, nonatomic) IBOutlet UIImageView *locationIconImageView;
@property ProfileViewModel *viewModel;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[ProfileViewModel alloc] init];
    [self setViewInformation];
    // Do any additional setup after loading the view, typically from a nib.
   }

- (void)setViewInformation{
    //revisar
    self.navigationItem.hidesBackButton = YES;
    
    isFullScreen = false;
    
    //image shape
    self.profileImageView.layer.cornerRadius = self.profileImageView.layer.frame.size.width/2;
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.userInteractionEnabled = YES;
    self.profileHeaderImageView.userInteractionEnabled = YES;
    
    //Si o si tienen que ser dos distintos para poderlos asignar??
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    UITapGestureRecognizer *singleTap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    
    [self.profileHeaderImageView addGestureRecognizer:singleTap2];
    [self.profileImageView addGestureRecognizer:singleTap];
    
    void(^successBlock)(NSString*, NSString*, NSString*, UIImage *, UIImage *) = ^(NSString *name, NSString *location, NSString *description, UIImage *profileImage, UIImage *headerImage){
        self.nameLabel.text = name;
        [self.nameLabel setTextColor: [UIColor blueColor]];
        
        self.locationLabel.text = location;
        [self.locationLabel setTextColor:[UIColor lightGrayColor]];
        
        self.profileDescriptionText.text = description;
        [self.profileHeaderImageView setImage:headerImage];
        [self.profileImageView setImage:profileImage];
    };
    
    [self.viewModel getDataSuccessBlock:successBlock failBlock:nil];
    
}

-(void)tapImageDetected:(UIGestureRecognizer *)sender{
    
    UIImageView *image = ((UIImageView *)[sender view]);
    if (!isFullScreen) {
        [self showElements:NO];
        image.hidden = NO;
        [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
            //save previous frame
            prevFrame = image.frame;
            [image setFrame:[[UIScreen mainScreen] bounds]];
        }completion:^(BOOL finished){
            isFullScreen = true;
        }];
        return;
    } else {
        [UIView animateWithDuration:0.3 delay:0 options:0 animations:^{
            [image setFrame:prevFrame];
        }completion:^(BOOL finished){
            isFullScreen = false;
            [self showElements:YES];
        }];
        return;
    }
}

- (void)showElements:(BOOL)show{
    self.editIconImageView.hidden = !show;
    self.locationIconImageView.hidden = !show;
    self.locationLabel.hidden = !show;
    self.profileImageView.hidden = !show;
    self.profileHeaderImageView.hidden = !show;
    self.profileDescriptionText.hidden = !show;
    self.nameLabel.hidden = !show;
}

@end
