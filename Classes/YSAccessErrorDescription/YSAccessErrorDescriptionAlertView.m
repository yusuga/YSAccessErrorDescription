//
//  YSAccessErrorDescriptionAlertView.m
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/11/15.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "YSAccessErrorDescriptionAlertView.h"
#import <KLCPopup/KLCPopup.h>

@interface YSAccessErrorDescriptionAlertView ()

@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@end

@implementation YSAccessErrorDescriptionAlertView

+ (instancetype)viewWithTitle:(NSString*)title contentView:(UIView*)contentView
{
    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    YSAccessErrorDescriptionAlertView *view = [[nib instantiateWithOwner:self options:nil] objectAtIndex:0];
    UINavigationItem *item = [[UINavigationItem alloc] initWithTitle:title];
    [view.navigationBar setItems:@[item]];
    
    CGRect frame = view.frame;
    frame.size.width = contentView.bounds.size.width;
    frame.size.height = contentView.bounds.size.height + view.navigationBar.bounds.size.height;
    view.frame = frame;
    
    frame = contentView.frame;
    frame.origin.y = view.navigationBar.bounds.size.height;
    contentView.frame = frame;
    
    [view addSubview:contentView];
    
    view.backgroundColor = contentView.backgroundColor;
    
    return view;
}

- (void)show
{
    KLCPopup *popup = [KLCPopup popupWithContentView:self
                                            showType:KLCPopupShowTypeBounceInFromBottom
                                         dismissType:KLCPopupDismissTypeBounceOutToBottom
                                            maskType:KLCPopupMaskTypeDimmed
                            dismissOnBackgroundTouch:YES
                               dismissOnContentTouch:YES];
    [popup show];
}

@end
