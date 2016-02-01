//
//  AIWebServices.m
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import "AIConstants.h"
#import "AIHTTPSessionManager.h"
#import "AIWebServices.h"

@implementation AIWebServices

+ (AIWebServices *)webServices
{
    AIWebServices *webServices = [[AIWebServices alloc] init];
    
    return webServices;
}

- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        _sessionManager = [AIHTTPSessionManager shared];
    }
    
    return self;
}

-(void)getAINactekValidation: (NSString *)searchedAI
                     success: (AIWebServicesSuccessHandler)successHandler
                     failure: (AIWebServicesFailureHandler)failureHandler
{
    
    
    NSString *trimmedURL = [searchedAI stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSURL *baseURL = [NSURL URLWithString:AINactemBaseURL];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",baseURL,trimmedURL]];
    
    [self.sessionManager GET: [url absoluteString]
                  parameters: nil
                     headers: nil
                     success: ^(NSURLSessionDataTask *task, id jsonObject)
     {
         successHandler(task, jsonObject);
     }
                     failure: ^(NSURLSessionDataTask *task, NSError *error)
     {
         dispatch_async(dispatch_get_main_queue(), ^{
             failureHandler(task, error);
         });
     }];
}

@end
