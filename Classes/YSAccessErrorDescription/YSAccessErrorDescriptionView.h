//
//  YSAccessErrorDescriptionView.h
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/07.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YSImageFilter/UIImage+YSImageFilter.h>
#import "YSAccessErrorDescriptionView.h"
#import "YSAccessErrorDescriptionUtility.h"

typedef NS_ENUM(NSUInteger, YSAccessErrorDescriptionSocialType) {
    YSAccessErrorDescriptionSocialTypeTwitter,
    YSAccessErrorDescriptionSocialTypeFacebook,
};

@protocol YSAccessErrorDescriptionViewProtocol <NSObject>

- (NSString*)title;

@end

@interface YSAccessErrorDescriptionView : UIView <YSAccessErrorDescriptionViewProtocol>

/* Account */
+ (instancetype)accountPrivacyErrorViewWithSocialType:(YSAccessErrorDescriptionSocialType)type;
+ (instancetype)accountZeroErrorWithSocialType:(YSAccessErrorDescriptionSocialType)type;
+ (instancetype)accountPermissionDeniedErrorWithSocialType:(YSAccessErrorDescriptionSocialType)type;

/* Photos */
+ (instancetype)photosPrivacyErrorView;

/* Setting */
- (void)setTextColor:(UIColor*)textColor noteColor:(UIColor*)noteColor;

/* Alert */
- (void)show;

/* Utility */
- (YSImageFilter*)imageFilter;

@end
