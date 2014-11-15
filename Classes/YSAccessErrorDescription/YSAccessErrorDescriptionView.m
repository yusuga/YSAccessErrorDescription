//
//  YSAccessErrorDescriptionView.m
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/07.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSAccessErrorDescriptionView.h"
#import <YSHelper/YSHelper.h>
#import "YSAccountErrorDescriptionPrivacyView.h"
#import "YSAccountErrorDescriptionZeroAccountView.h"
#import "YSAccountErrorDescriptionPermissionDeniedView.h"
#import "YSPhotosErrorDescriptionView.h"
#import "YSAccessErrorDescriptionAlertView.h"

@interface YSAccessErrorDescriptionView ()

@property (weak, nonatomic) IBOutlet UIImageView *settingImageView;
@property (weak, nonatomic) IBOutlet UIImageView *privacyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *appLabel;

@end

@implementation YSAccessErrorDescriptionView

#pragma mark - Account

+ (instancetype)accountPrivacyErrorViewWithSocialType:(YSAccessErrorDescriptionSocialType)type
{
    return [[YSAccountErrorDescriptionPrivacyView alloc] initWithSocialType:type];
}

+ (instancetype)accountZeroErrorWithSocialType:(YSAccessErrorDescriptionSocialType)type;
{
    return [[YSAccountErrorDescriptionZeroAccountView alloc] initWithSocialType:type];
}

+ (instancetype)accountPermissionDeniedErrorWithSocialType:(YSAccessErrorDescriptionSocialType)type
{
    return [[YSAccountErrorDescriptionPermissionDeniedView alloc] initWithSocialType:type];
}

#pragma mark - Photos

+ (instancetype)photosPrivacyErrorView
{
    return [[YSPhotosErrorDescriptionView alloc] init];
}

#pragma mark - Initial

- (instancetype)init
{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    NSArray *views = [nib instantiateWithOwner:self options:nil];
    NSInteger tag = [YSHelper isJapaneseLanguage] ? 0 : 1;
    for (UIView *v in views) {
        if (v.tag == tag) {
            self = (id)v;
            break;
        }
    }
    
    YSImageFilter *filter = [self imageFilter];
    self.settingImageView.image = [[UIImage imageNamed:@"setting"] ys_filter:filter];
    self.privacyImageView.image = [[UIImage imageNamed:@"privacy"] ys_filter:filter];
    
    if (self.appImageView) {
        UIImage *appIcon = [UIImage imageNamed:@"AppIcon60x60"];
        UIImage *padAppIcon = [UIImage imageNamed:@"AppIcon76x76"];
        if (padAppIcon.size.width > appIcon.size.width) {
            appIcon = padAppIcon;
        }        
        self.appImageView.image = [appIcon ys_filter:[self imageFilter]];
        self.appLabel.text = [NSString stringWithFormat:self.appLabel.text, [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"]];
        [self.appLabel sizeToFit];
    }
    
    return self;
}

#pragma mark - Public

- (void)setTextColor:(UIColor*)textColor noteColor:(UIColor *)noteColor
{
    [UILabel appearanceWhenContainedIn:[self class], nil].textColor = textColor;
}

- (void)show
{
    [[YSAccessErrorDescriptionAlertView viewWithTitle:[self title]
                                         contentView:self] show];
}

#pragma mark Utility

- (YSImageFilter*)imageFilter
{
    YSImageFilter *filter = [[YSImageFilter alloc] init];
    filter.mask = YSImageFilterMaskRoundedCornersIOS7RadiusRatio;
    return filter;
}

#pragma mark - YSAccessErrorDescriptionView

- (NSString *)title
{
    abort();
}

@end
