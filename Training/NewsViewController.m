//
//  FirstViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 2/20/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewController.h"
#import "NewsViewModel.h"
#import "PostViewController.h"

@interface NewsViewController ()

@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property NewsViewModel *nToShow;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.addButton.layer.cornerRadius = self.addButton.layer.frame.size.width/2;
    self.addButton.clipsToBounds = YES;
}

- (IBAction)addButton:(id)sender {
    [self performSegueWithIdentifier:@"editorNewShow" sender:self];
}

- (void)showNew:(NewsViewModel*)nModel{
    self.nToShow = nModel;
    [self performSegueWithIdentifier:@"postShow" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedNewsTable"]){
        ((NewsTableViewController *)[segue destinationViewController]).delegate = self;
    } else if([segue.identifier isEqualToString:@"postShow"]){
        [((PostViewController *)[segue destinationViewController])defineViewModel:[[NewViewModel alloc]initWithModel:self.nToShow]];
    }
}

-(IBAction)unwindToTable:(UIStoryboardSegue *)segue{
    /*
     NewEditorViewController *source = [segue sourceViewController];
     NewModel *new = source.new;
     if (item != nil) {
     [self.toDoItems addObject:item];
     [self.tableView reloadData];
     }*/
    NSLog(@"volvi");
}

@end
