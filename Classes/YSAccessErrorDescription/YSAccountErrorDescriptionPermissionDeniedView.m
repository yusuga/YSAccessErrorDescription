//
//  YSAccountErrorDescriptionPermissionDeniedView.m
//  YSAccountErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/06.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSAccountErrorDescriptionPermissionDeniedView.h"

@interface YSAccountErrorDescriptionPermissionDeniedView ()

@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@end

@implementation YSAccountErrorDescriptionPermissionDeniedView

- (void)setTextColor:(UIColor *)textColor noteColor:(UIColor*)noteColor
{
    [super setTextColor:textColor noteColor:noteColor];
    self.noteLabel.textColor = noteColor;
}

@end
