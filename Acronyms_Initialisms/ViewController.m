//
//  ViewController.m
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import "ViewController.h"
#import "AIDataSource.h"
#import "AFNetworking/AFNetworking.h"
#import "AIConstants.h"
#import "AIDefinition.h"
#import "MBProgressHUD.h"
#import "DefCustomCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *aiSearchBar;
@property (weak, nonatomic) IBOutlet UITableView *aiTableView;
@property (nonatomic, readonly) AIDataSource * searchAIDataSource;
@property (nonatomic, readonly) NSArray * definitionsArray;

@end

@implementation ViewController


- (instancetype)initWithCoder: (NSCoder *)coder
{
    self = [super initWithCoder: coder];
    
    if (self) {
        
        _searchAIDataSource = [AIDataSource AIDataSource];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.aiTableView registerNib: [
                                    DefCustomCell nib]
           forCellReuseIdentifier: [DefCustomCell reuseIdentifier]];
    self.aiTableView.allowsSelection = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    //  isSearching = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    if([searchText length] != 0) {
        
    }
    else {
        _definitionsArray = nil;
        [self.aiTableView reloadData];
    }
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    typeof(self) __weak weakSelf = self;
    
    [self.searchAIDataSource getSearchedAI:searchBar.text
                                   success:^(NSArray *results)
     {
         _definitionsArray = results;
         
         [weakSelf.aiTableView reloadData];
         dispatch_async(dispatch_get_main_queue(), ^{
             [MBProgressHUD hideHUDForView:self.view animated:YES];
         });
         
         
     } failure:^(NSError *error) {
         //Failure is already in main thread
         [MBProgressHUD hideHUDForView:self.view animated:YES];
     }];
    
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{
    // Normally I would have this returned from the dataSource. DataSource would have a method that calcuates and returns the count of sections.
    return 1;
}

- (NSInteger)tableView: (UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    // Normally I would have this returned from the dataSource. DataSource would have a method that calcuates and returns the count of rows.
    
    return self.definitionsArray.count;
}


- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath: (NSIndexPath *)indexPath
{
    DefCustomCell *cell = [tableView dequeueReusableCellWithIdentifier: [DefCustomCell reuseIdentifier]
                                                          forIndexPath: indexPath];
    AIDefinition * word = [self.definitionsArray objectAtIndex:indexPath.row];
    
    [cell setDefinition:word.definition];
    
    return cell;
}
@end
