//
//  LongFormTableCell.m
//  Acronyms
//
//  Created by Mace Windu on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "LongFormTableCell.h"

@implementation LongFormTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:[LongFormTableCell identifier]];
    if (self) {
    }
    return self;
}

- (void)configureCellForLongForm:(LongForm*)longform {
    self.textLabel.text = longform.lf;
    self.detailTextLabel.text = [NSString stringWithFormat:@"Frequency:%@ Since:%@", longform.freq, longform.since];
    self.detailTextLabel.textColor = [UIColor grayColor];
    if (longform.vars.count) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
}

+ (NSString*)identifier {
    return NSStringFromClass(self.class);
}

@end
