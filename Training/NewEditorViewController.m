//
//  NewEditorViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/6/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewEditorViewController.h"
#import "NewEditorViewModel.h"
#import "UIView+Toast.h"
#import "ValidationAnswerModel.h"

@interface NewEditorViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *nImageView;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextView *dataTextView;
@property UIImagePickerController *imgPicker;

@property NewEditorViewModel *viewModel;

@end

@implementation NewEditorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.viewModel = [[NewEditorViewModel alloc] init];
    [self setImagePicker];
    [self setStyle];
}

- (IBAction)createNew:(id)sender {
    NSString *data = [NSString stringWithFormat:@"%@", self.dataTextView.text];
    ValidationAnswerModel *ans = [self.viewModel checkInformationTitle:self.titleTextField.text data:data];
    if(ans.pass){
        [self.viewModel createNewWithArray:@{@"title":self.titleTextField.text,
                                             @"data":self.dataTextView.text,
                                             @"imageNew":self.nImageView.image
                                            }
                              success:^{
                                  dispatch_async(dispatch_get_main_queue(), ^{
                                        [self.navigationController popViewControllerAnimated:YES];
                                  });
                              }
                                 fail:^(NSString *msg){
                                     [self.view makeToast:msg];
                                 }];
    } else {
        [self.view makeToast:ans.errorMsg];
    }
}

-(void)setImagePicker{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    [self.nImageView addGestureRecognizer:singleTap];
    self.imgPicker = [[UIImagePickerController alloc] init];
    self.imgPicker.allowsEditing = YES;
    self.imgPicker.delegate = self;
    self.imgPicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
}

-(void)tapImageDetected:(UIGestureRecognizer *)sender{
    [self presentViewController:self.imgPicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    self.nImageView.image = info[@"UIImagePickerControllerEditedImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setStyle{
    self.dataTextView.layer.borderWidth = 0.5f;
    self.dataTextView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

@end