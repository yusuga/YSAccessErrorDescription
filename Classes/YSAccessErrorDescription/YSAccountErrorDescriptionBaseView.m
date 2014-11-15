//
//  YSAccountErrorDescriptionBaseView.m
//  YSAccountErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/06.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSAccountErrorDescriptionBaseView.h"

@interface YSAccountErrorDescriptionBaseView ()

@property (weak, nonatomic) IBOutlet UIImageView *socialImageView;
@property (weak, nonatomic) IBOutlet UILabel *socialLabel;
@property (weak, nonatomic) IBOutlet UIImageView *personImageView;

@end

@implementation YSAccountErrorDescriptionBaseView

- (instancetype)initWithSocialType:(YSAccessErrorDescriptionSocialType)type
{
    if (self = [self init]) {
        
        YSImageFilter *filter = [self imageFilter];
        
        switch (type) {
            case YSAccessErrorDescriptionSocialTypeTwitter:
                self.socialLabel.text = [NSString stringWithFormat:self.socialLabel.text, @"Twitter"];
                self.socialImageView.image = [[UIImage imageNamed:@"twitter"] ys_filter:filter];
                break;
            case YSAccessErrorDescriptionSocialTypeFacebook:
                self.socialLabel.text = [NSString stringWithFormat:self.socialLabel.text, @"Facebook"];
                self.socialImageView.image = [[UIImage imageNamed:@"facebook"] ys_filter:filter];
                break;
            default:
                NSLog(@"%s; Unsupported social type: %zd", __func__, type);
                break;
        }
        [self.socialLabel sizeToFit];
        
        if (self.personImageView) {
            self.personImageView.image = [[UIImage imageNamed:@"person"] ys_filter:filter];
        }
    }
    return self;
}

- (NSString *)title
{
    return YSAccessErrorDescriptionLocalizedString(@"Account Error");
}

@end
