//
//  AIDataSource.m
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 1/29/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AIWebServices.h"
#import "AIDefinition.h"
#import "AIDataSource.h"

@interface AIDataSource ()

@property (strong, nonatomic) AIWebServices *webServices;

@end

@implementation AIDataSource

+ (instancetype)AIDataSource
{
    AIDataSource * wordDataSource = [[self alloc] init];
    return wordDataSource;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.webServices = [AIWebServices webServices];
    }
    
    return self;
}

- (void)getSearchedAI: (NSString *)searcedAI success: (AIGetSearchedSuccessHandler)successHandler failure: (AIGetSearchedFailureHandler)failureHandler{
    
    [self.webServices getAINactekValidation:searcedAI
                                    success:^(NSURLSessionDataTask *task, id jsonObject){
    
                                        
                                        NSArray * resultsArray = (jsonObject != nil) ? (NSArray *)jsonObject : nil;
                                        NSMutableArray * defObjArray = [NSMutableArray new];
                                        
                                        if (resultsArray.count > 0){
                                            
                                        NSArray *definitionDetailsArray = [resultsArray valueForKey:@"lfs"];
                                        
                                        NSArray * defArray = [definitionDetailsArray
                                                             valueForKey:@"lf"];
                                        
                                            
                                        NSArray * objArray = [defArray objectAtIndex:0];
                                        
                                        for (NSString * def in objArray){
                                            AIDefinition * newDef = [AIDefinition new];
                                            newDef.definition = def;
                                            [defObjArray addObject:newDef];
                                        }
                                        
                                    }
                                        else{
                                            AIDefinition * newDef = [AIDefinition new];
                                            newDef.definition = @"Searched item not found";
                                            [defObjArray addObject:newDef];
                                            
                                        }
                                        successHandler (defObjArray);
                                    }
    
                                    failure:^(NSURLSessionDataTask *task, NSError *error){
                                        failureHandler(error);
                                    }];

}

@end
