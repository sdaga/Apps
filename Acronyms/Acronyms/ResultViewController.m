//
//  ResultViewController.m
//  Acronyms
//
//  Created by Subhash Daga on 3/8/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "ResultViewController.h"
#import "LongFormTableCell.h"
#import "EmptyTableCell.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (instancetype)initWithSearchResults:(NSArray*)searchResults title:(NSString*)title {
    self = [super init];
    if (self) {
        self.searchResults = searchResults;
        self.title = title;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[LongFormTableCell class]
           forCellReuseIdentifier:[LongFormTableCell identifier]];
    [self.tableView registerClass:[EmptyTableCell class]
           forCellReuseIdentifier:[EmptyTableCell identifier]];
}

- (void)setSearchResults:(NSArray *)searchResults {
    _searchResults = searchResults;
    [self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults ? MAX(self.searchResults.count, 1) : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (self.searchResults.count) {
        LongFormTableCell *longFormCell = [self.tableView dequeueReusableCellWithIdentifier:[LongFormTableCell identifier]];
        [longFormCell configureCellForLongForm:[self.searchResults objectAtIndex:indexPath.row]];
        cell = longFormCell;
    } else {
        cell = [self.tableView dequeueReusableCellWithIdentifier:[EmptyTableCell identifier]];
    }
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.searchResults.count) {
        LongForm *longForm = [self.searchResults objectAtIndex:indexPath.row];
        if (longForm.vars.count) {
            ResultViewController *rvc = [[ResultViewController alloc] initWithSearchResults:longForm.vars
                                                                                      title:@"Variations"];
            [self.navigationController pushViewController:rvc animated:YES];
        }
    }
}

@end
