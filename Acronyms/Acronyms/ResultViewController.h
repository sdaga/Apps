//
//  ResultViewController.h
//  Acronyms
//
//  Created by Mace Windu on 3/8/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "LongForm.h"

@interface ResultViewController : UITableViewController

@property (nonatomic, strong) NSArray *searchResults;

- (instancetype)initWithSearchResults:(NSArray*)searchResults title:(NSString*)title;

@end
