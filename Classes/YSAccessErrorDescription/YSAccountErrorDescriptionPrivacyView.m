//
//  YSAccountErrorDescriptionPrivacyView.m
//  YSAccountErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/06.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSAccountErrorDescriptionPrivacyView.h"
#import <YSImageFilter/UIImage+YSImageFilter.h>

@interface YSAccountErrorDescriptionPrivacyView ()

@end

@implementation YSAccountErrorDescriptionPrivacyView

- (id)initWithAccountTypeIdentifier:(NSString *)typeID appIconImage:(UIImage*)appIconImage
{
    if (self = [super initWithAccountTypeIdentifier:typeID]) {
        [self setAppIconImage:appIconImage];
    }
    return self;
}

@end
