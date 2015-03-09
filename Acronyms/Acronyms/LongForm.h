//
//  LongForm.h
//  Acronyms
//
//  Created by Subhash Daga on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

@interface LongForm : NSObject

@property (nonatomic, strong) NSString *lf;
@property (nonatomic, strong) NSNumber *freq;
@property (nonatomic, strong) NSNumber *since;
@property (nonatomic, strong) NSArray *vars;

- (instancetype)initWithLongForm:(NSString*)lf freq:(NSNumber*)freq since:(NSNumber*)since vars:(NSArray*)vars;

@end
