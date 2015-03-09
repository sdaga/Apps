//
//  EmptyTableCell.m
//  Acronyms
//
//  Created by Mace Windu on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "EmptyTableCell.h"

@implementation EmptyTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[EmptyTableCell identifier]];
    if (self) {
        self.textLabel.text = @"Nothing found!";
    }
    return self;
}

+ (NSString*)identifier {
    return NSStringFromClass(self.class);
}

@end
