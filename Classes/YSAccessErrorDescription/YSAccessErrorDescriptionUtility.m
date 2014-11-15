//
//  YSAccessErrorDescriptionUtility.m
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/11/15.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSAccessErrorDescriptionUtility.h"

NSString *YSAccessErrorDescriptionLocalizedString(NSString *key)
{
    return NSLocalizedStringFromTable(key, @"YSAccessErrorDescriptionLocalizable", nil);
}

@implementation YSAccessErrorDescriptionUtility

@end
