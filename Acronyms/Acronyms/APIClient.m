//
//  APIClient.m
//  Acronyms
//
//  Created by Mace Windu on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking/AFNetworking.h>
#import "LongForm.h"

@implementation APIClient

+ (void)getLongFormsForSearch:(NSString*)search success:(FetchSuccess)success failure:(FetchFailure)failure {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    [manager GET:@"http://www.nactem.ac.uk/software/acromine/dictionary.py"
      parameters:@{@"sf":search}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             success([self parseResponse:responseObject]);
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             failure(error);
         }];
}

+ (NSArray*)parseResponse:(id)responseObject {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    NSArray *responseArray = (NSArray*)responseObject;
    if (responseArray.count == 1) {
        NSDictionary *responseDict = (NSDictionary*)responseArray[0];
        if (responseDict) {
            NSArray *lfsArray = responseDict[@"lfs"];
            for (NSDictionary *lfDict in lfsArray) {
                // process vars
                NSArray *varsArray = lfDict[@"vars"];
                NSMutableArray *varsLongFormObjArray;
                if (varsArray) {
                    varsLongFormObjArray = [[NSMutableArray alloc] init];
                    for (NSDictionary *varDict in varsArray) {
                        LongForm *lf = [[LongForm alloc] initWithLongForm:varDict[@"lf"]
                                                                     freq:varDict[@"freq"]
                                                                    since:varDict[@"since"]
                                                                     vars:nil];
                        [varsLongFormObjArray addObject:lf];
                    }
                }
                // process root
                LongForm *lf = [[LongForm alloc] initWithLongForm:lfDict[@"lf"]
                                                             freq:lfDict[@"freq"]
                                                            since:lfDict[@"since"]
                                                             vars:varsLongFormObjArray];
                [result addObject:lf];
            }
        }
    }
    return result;
}

@end
