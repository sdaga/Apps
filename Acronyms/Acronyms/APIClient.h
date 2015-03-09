//
//  APIClient.h
//  Acronyms
//
//  Created by  on 3/7/15.
//  Copyright (c) 2015 Acronyms. All rights reserved.
//

typedef void(^FetchSuccess)(NSArray *result);
typedef void(^FetchFailure)(NSError *error);

@interface APIClient : NSObject

+ (void)getLongFormsForSearch:(NSString*)search success:(FetchSuccess)success failure:(FetchFailure)failure;

@end
