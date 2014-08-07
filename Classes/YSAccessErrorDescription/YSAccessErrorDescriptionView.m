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

@interface YSAccessErrorDescriptionView ()

@property (weak, nonatomic) IBOutlet UIImageView *settingImageView;
@property (weak, nonatomic) IBOutlet UIImageView *privacyImageView;
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *appLabel;

@end

@implementation YSAccessErrorDescriptionView

#pragma mark - Account

+ (YSAccessErrorDescriptionView*)accountPrivacyErrorViewWithAccountTypeIdentifier:(NSString*)typeID
                                                                     appIconImage:(UIImage*)appIconImage
{
    return [[YSAccountErrorDescriptionPrivacyView alloc] initWithAccountTypeIdentifier:typeID
                                                                          appIconImage:appIconImage];
}

+ (YSAccessErrorDescriptionView*)accountZeroErrorWithAccountTypeIdentifier:(NSString*)typeID
{
    return [[YSAccountErrorDescriptionZeroAccountView alloc] initWithAccountTypeIdentifier:typeID];
}

+ (YSAccessErrorDescriptionView*)accountPermissionDeniedErrorWithAccountTypeIdentifier:(NSString*)typeID
{
    return [[YSAccountErrorDescriptionPermissionDeniedView alloc] initWithAccountTypeIdentifier:typeID];
}

#pragma mark - Photos

+ (YSAccessErrorDescriptionView*)photosPrivacyErrorViewWithAppIconImage:(UIImage*)appIconImage
{
    return [[YSPhotosErrorDescriptionView alloc] initWithAppIconImage:appIconImage];
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
    
    return self;
}

#pragma mark - Public

- (void)setTextColor:(UIColor*)textColor noteColor:(UIColor *)noteColor
{
    [UILabel appearanceWhenContainedIn:[self class], nil].textColor = textColor;
}

#pragma mark Utility

- (YSImageFilter*)imageFilter
{
    YSImageFilter *filter = [[YSImageFilter alloc] init];
    filter.mask = YSImageFilterMaskRoundedCornersIOS7RadiusRatio;
    return filter;
}

- (void)setAppIconImage:(UIImage*)appIconImage
{
    UIImage *icon = appIconImage;
    if (icon == nil) {
        icon = [UIImage imageNamed:@"Icon"];
    }
    self.appImageView.image = [icon ys_filter:[self imageFilter]];
    self.appLabel.text = [NSString stringWithFormat:self.appLabel.text, [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"]];
    [self.appLabel sizeToFit];
}

@end
