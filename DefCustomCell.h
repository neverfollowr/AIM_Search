//
//  DefCustomCell.h
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 2/1/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DefCustomCell : UITableViewCell

+ (UINib *)nib;

+ (NSString *)reuseIdentifier;

- (void)setDefinition: (NSString *)text;

@end
