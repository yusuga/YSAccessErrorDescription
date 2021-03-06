//
//  YSPhotosErrorDescriptionView.m
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/07.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSPhotosErrorDescriptionView.h"

@interface YSPhotosErrorDescriptionView ()

@property (weak, nonatomic) IBOutlet UIImageView *photosImageView;

@end

@implementation YSPhotosErrorDescriptionView

- (instancetype)init
{
    if (self = [super init]) {
        self.photosImageView.image = [[UIImage imageNamed:@"photos"] ys_filter:[self imageFilter]];        
    }
    return self;
}

- (NSString *)title
{
    return YSAccessErrorDescriptionLocalizedString(@"Privacy Error");
}

@end
