//
//  AIDefinition.h
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 2/1/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AIDefinition : NSObject

@property (copy, nonatomic) NSString *definition;
//Made the following properties but are not used. Made them for modeling purposes. 
@property (copy, nonatomic) NSString *freq;
@property (copy, nonatomic) NSString *since;

@end
