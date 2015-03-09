//
//  MainViewController.m
//  Acronyms
//
//  Created by Subhash Daga on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "MainViewController.h"
#import "APIClient.h"
#import "ResultViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>

@interface MainViewController () <UISearchBarDelegate>

@property (nonatomic, strong) IBOutlet UISearchBar *searchBar;
@property (nonatomic, strong) ResultViewController *resultViewController;

@end

@implementation MainViewController

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.searchBar;
    [self addResultViewController];
}

- (void)addResultViewController {
    self.resultViewController = [[ResultViewController alloc] initWithSearchResults:nil
                                                                              title:@"Results"];
    [self addChildViewController:self.resultViewController];
    self.resultViewController.view.frame = self.view.bounds;
    [self.view addSubview:self.resultViewController.view];
    [self.resultViewController didMoveToParentViewController:self];
}

- (void)handleSearchSuccess:(NSArray *)result {
    self.resultViewController.searchResults = result;
}

- (void)handleSearchFailure:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error"
                                                    message:error.localizedDescription
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

- (void)showProgressHUD {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.labelText = @"Loading";
    [hud show:YES];
}

- (void)hideProgressHUD {
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];
}

#pragma mark UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        self.resultViewController.searchResults = nil;
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self showProgressHUD];
    [self.searchBar endEditing:YES];
    [APIClient getLongFormsForSearch:searchBar.text
                             success:^(NSArray *result) {
                                 [self hideProgressHUD];
                                 [self handleSearchSuccess:result];
                             }
                             failure:^(NSError *error) {
                                 [self hideProgressHUD];
                                 [self handleSearchFailure:error];
                             }];
}

@end
