//
//  AIDataSource.h
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^AIGetSearchedSuccessHandler)(NSArray *results);
typedef void (^AIGetSearchedFailureHandler)(NSError *error);

@interface AIDataSource : NSObject

+ (instancetype)AIDataSource;

- (void)getSearchedAI: (NSString *)searcedAI success: (AIGetSearchedSuccessHandler)successHandler failure: (AIGetSearchedFailureHandler)failureHandler;

@end
