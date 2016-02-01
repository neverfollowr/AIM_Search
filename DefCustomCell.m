//
//  DefCustomCell.m
//  Acronyms_Initialisms
//
//  Created by Mashuf Chowdhury on 2/1/16.
//  Copyright © 2016 Mashuf Chowdhury. All rights reserved.
//

#import "DefCustomCell.h"

@interface DefCustomCell ()

@property (weak, nonatomic) IBOutlet UILabel *defLabel;

@end

@implementation DefCustomCell

+ (UINib *)nib
{
    UINib *cellNIB = [UINib nibWithNibName: NSStringFromClass([self class])
                                    bundle: nil];
    return cellNIB;
}

+ (NSString *)reuseIdentifier
{
    NSString *reuseIdentifier = NSStringFromClass([self class]);
    return reuseIdentifier;
}

- (void)setDefinition: (NSString *)text
{
    self.defLabel.text = text;
}



@end
