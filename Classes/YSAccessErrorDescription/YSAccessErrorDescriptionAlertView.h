//
//  YSAccessErrorDescriptionAlertView.h
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/11/15.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YSAccessErrorDescriptionAlertView : UIView

+ (instancetype)viewWithTitle:(NSString*)title contentView:(UIView*)contentView;
- (void)show;

@end
