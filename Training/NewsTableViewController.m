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
#import "PostViewController.h"

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
    NewsViewModel *new = [self.viewModel objectAtIndex:[sender view].tag];
    [new favoriteStateChange];
    ((UIImageView *)[sender view]).image = [new favoriteImage];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self.delegate showNew:[self.viewModel objectAtIndex:indexPath.row]];
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
    NewsViewModel *newViewModel = [self.viewModel objectAtIndex:index];
    cell.nameTextField.text = [newViewModel getAuthorName];
    cell.descriptionLabel.text = [newViewModel getDescriptionLabel];
    cell.timeLabel.text = [newViewModel getTime];
    cell.profileImage.image = [newViewModel getImage];;
    cell.favoriteImage.tag = index;
    cell.favoriteImage.image = [newViewModel favoriteImage];
}

@end
