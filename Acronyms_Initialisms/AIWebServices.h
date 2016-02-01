//
//  AIWebServices.h
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AIHTTPSessionManager;

typedef void (^AIWebServicesSuccessHandler)(NSURLSessionDataTask *task, id jsonObject);
typedef void (^AIWebServicesFailureHandler)(NSURLSessionDataTask *task, NSError *error);

@interface AIWebServices : NSObject

@property (readonly, strong, nonatomic) AIHTTPSessionManager *sessionManager;


+ (AIWebServices *)webServices;

-(void)getAINactekValidation: (NSString *)searchedAI
                               success: (AIWebServicesSuccessHandler)successHandler
                               failure: (AIWebServicesFailureHandler)failureHandler;


@end
