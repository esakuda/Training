//
//  NewsTableViewController.m
//  Training
//
//  Created by María Eugenia Sakuda on 3/3/15.
//  Copyright (c) 2015 María Eugenia Sakuda. All rights reserved.
//

#import "NewsTableViewController.h"
#import "NewsTableViewModel.h"
#import "NewTableViewCell.h"
#import "NewModel.h"
#import "UIView+Toast.h"
#import "NSDate+TimeAgo.h"

@interface NewsTableViewController ()

@property  NewsTableViewModel *viewModel;
@property  long count;

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeRefreshControl];
    [self initializeData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.count = [self.viewModel newsCount];
    return self.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewTableViewCell *cell = (NewTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"newsCell"];
    
    [self chargeCellData:cell index:indexPath.row];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageDetected:)];
    [cell.favoriteImage addGestureRecognizer:singleTap];

    return cell;
}

- (void)getAllNewsCritical:(BOOL)critical{
    if(critical){
        [self.viewModel getAllNewsSuccess:^{
                                            [self.refreshControl endRefreshing];
                                            }
                                     fail:^(NSString *msg){
                                                            [self.refreshControl endRefreshing];
                                                            [self.view makeToast:msg];
                                                        }];
    } else {
        [self.viewModel getAllNewsSuccess:^{
                                            [self.refreshControl endRefreshing];
                                            }
                                     fail:nil];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tapImageDetected:(UIGestureRecognizer *)sender{
    BOOL favorite = [self.viewModel favoriteStateChange:[sender view].tag];
    if(favorite){
        ((UIImageView *)[sender view]).image = [UIImage imageNamed:@"i-like-active.png"];
    } else {
        ((UIImageView *)[sender view]).image = [UIImage imageNamed:@"i-like-inactive.png"];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (void)reloadTable:(NSNotification *)notification {
    [self getAllNewsCritical:YES];
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
}

- (void)initializeData{
    if(self.viewModel == nil){
        self.viewModel = [[NewsTableViewModel alloc] init];
        [self.refreshControl beginRefreshing];
        [self getAllNewsCritical:YES];
    }
    [self getAllNewsCritical:NO];
}

- (void)initializeRefreshControl{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(reloadTable:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

- (void)chargeCellData:(NewTableViewCell*)cell index:(unsigned long)index{
    NewModel *new = [self.viewModel objectAtIndex:index];
    cell.nameTextField.text = new.authorName;
    cell.descriptionLabel.text = new.data;
    cell.timeLabel.text = new.time.timeAgoSimple;
    cell.profileImage.image = new.image;
    cell.favoriteImage.tag = index;
    
    if(new.favorite){
        cell.favoriteImage.image = [UIImage imageNamed:@"i-like-active.png"];
    }
}
@end
