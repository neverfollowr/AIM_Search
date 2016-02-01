//
//  AIHTTPSessionManager.m
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import "AIHTTPSessionManager.h"

@implementation AIHTTPSessionManager


+ (AIHTTPSessionManager *)shared
{
    static dispatch_once_t once;
    static AIHTTPSessionManager *sharedInstance;
    
    dispatch_once(&once, ^
                  {
                      NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
                      
                      sharedInstance = [[self alloc] initWithSessionConfiguration: sessionConfiguration];
                  });
    
    return sharedInstance;
}




- (instancetype)initWithSessionConfiguration: (NSURLSessionConfiguration *)sessionConfiguration
{
    self = [super initWithSessionConfiguration: sessionConfiguration];
    
    if (self)
    {
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    }
    
    return self;
}

- (NSURLSessionDataTask *)GET: (NSString *)URLString
                   parameters: (id)parameters
                      headers: (NSDictionary *)headers
                      success: (void (^)(NSURLSessionDataTask *task, id jsonObject))success
                      failure: (void (^)(NSURLSessionDataTask *task, NSError *error))failure
{

    NSURLSessionDataTask *task = [super GET:URLString
                                 parameters:nil
                                   progress:nil
                                    success:success
                                    failure:failure];
    
    return task;
    
}

@end
