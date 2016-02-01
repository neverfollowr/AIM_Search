//
//  AIHTTPSessionManager.h
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"

@interface AIHTTPSessionManager : AFHTTPSessionManager

+ (AIHTTPSessionManager *)shared;

- (NSURLSessionDataTask *)GET: (NSString *)URLString
                   parameters: (id)parameters
                      headers: (NSDictionary *)headers
                      success: (void (^)(NSURLSessionDataTask *task, id jsonObject))success
                      failure: (void (^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
