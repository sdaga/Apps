//
//  LongForm.m
//  Acronyms
//
//  Created by Mace Windu on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "LongForm.h"

@implementation LongForm

- (instancetype)initWithLongForm:(NSString*)lf freq:(NSNumber*)freq since:(NSNumber*)since vars:(NSArray *)vars {
    self = [super init];
    if (self) {
        self.lf = lf;
        self.freq = freq;
        self.since = since;
        self.vars = vars;
    }
    return self;
}

@end
