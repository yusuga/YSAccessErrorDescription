//
//  YSAccessErrorDescriptionView.h
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/07.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YSImageFilter/UIImage+YSImageFilter.h>
@import Accounts;
#import "YSAccessErrorDescriptionView.h"

@interface YSAccessErrorDescriptionView : UIView

/* Account */
+ (YSAccessErrorDescriptionView*)accountPrivacyErrorViewWithAccountTypeIdentifier:(NSString*)typeID
                                                                     appIconImage:(UIImage*)appIconImage;

+ (YSAccessErrorDescriptionView*)accountZeroErrorWithAccountTypeIdentifier:(NSString*)typeID;

+ (YSAccessErrorDescriptionView*)accountPermissionDeniedErrorWithAccountTypeIdentifier:(NSString*)typeID;

/* Photos */

+ (YSAccessErrorDescriptionView*)photosPrivacyErrorViewWithAppIconImage:(UIImage*)appIconImage;

/* Setting */
- (void)setTextColor:(UIColor*)textColor noteColor:(UIColor*)noteColor;

/* Utility */
- (YSImageFilter*)imageFilter;
- (void)setAppIconImage:(UIImage*)appIconImage;

@end
