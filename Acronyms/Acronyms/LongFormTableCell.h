//
//  LongFormTableCell.h
//  Acronyms
//
//  Created by Subhash Daga on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "LongForm.h"

@interface LongFormTableCell : UITableViewCell

- (void)configureCellForLongForm:(LongForm*)longform;
+ (NSString*)identifier;

@end
