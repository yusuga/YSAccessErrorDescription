//
//  ViewController.m
//  YSAccessErrorDescriptionExample
//
//  Created by Yu Sugawara on 2014/08/07.
//  Copyright (c) 2014年 Yu Sugawara. All rights reserved.
//

#import "ViewController.h"
#import "YSAccessErrorDescriptionView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *privacyControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *zeroControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *permissionControl;

@property (weak, nonatomic) IBOutlet UIView *descriptionContainerView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *colorControl;

@end

@implementation ViewController

#pragma mark - Privacy

- (IBAction)privacyControlDidChange:(UISegmentedControl *)sender
{
    self.zeroControl.selectedSegmentIndex = self.permissionControl.selectedSegmentIndex = -1;
    [self addErrorDescriptionView:[self accountPrivacyErrorDescriptionView]];
}

- (IBAction)privacyPresentButtonDidPush:(id)sender
{
    if (self.privacyControl.selectedSegmentIndex == -1) {
        self.privacyControl.selectedSegmentIndex = 0;
    }
    
    YSAccessErrorDescriptionView *view = [self accountPrivacyErrorDescriptionView];
    [self configureColorToErrorDescriptionView:view];
    [view show];
}

- (YSAccessErrorDescriptionView*)accountPrivacyErrorDescriptionView
{
    switch (self.privacyControl.selectedSegmentIndex) {
        case 0:
            return [YSAccessErrorDescriptionView accountPrivacyErrorViewWithSocialType:YSAccessErrorDescriptionSocialTypeTwitter];
        case 1:
            return [YSAccessErrorDescriptionView accountPrivacyErrorViewWithSocialType:YSAccessErrorDescriptionSocialTypeFacebook];
        case 2:
            return [YSAccessErrorDescriptionView photosPrivacyErrorView];
        default:
            abort();
    }
}

#pragma mark - Account Zero

- (IBAction)zeroControlDidChange:(UISegmentedControl *)sender
{
    self.privacyControl.selectedSegmentIndex = self.permissionControl.selectedSegmentIndex = -1;
    [self addErrorDescriptionView:[self accountZeroErrorDescriptionView]];
}

- (IBAction)zeroPresentButtonDidPush:(id)sender
{
    if (self.zeroControl.selectedSegmentIndex == -1) {
        self.zeroControl.selectedSegmentIndex = 0;
    }
    
    YSAccessErrorDescriptionView *view = [self accountZeroErrorDescriptionView];
    [self configureColorToErrorDescriptionView:view];
    [view show];
}

- (YSAccessErrorDescriptionView*)accountZeroErrorDescriptionView
{
    switch (self.zeroControl.selectedSegmentIndex) {
        case 0:
            return [YSAccessErrorDescriptionView accountZeroErrorWithSocialType:YSAccessErrorDescriptionSocialTypeTwitter];
        case 1:
            return [YSAccessErrorDescriptionView accountZeroErrorWithSocialType:YSAccessErrorDescriptionSocialTypeFacebook];
        default:
            abort();
    }
}

#pragma mark - Account Permission

- (IBAction)permissionControlDidChange:(UISegmentedControl *)sender
{
    self.privacyControl.selectedSegmentIndex = self.zeroControl.selectedSegmentIndex = -1;
    [self addErrorDescriptionView:[self accountPermissionErrorDescriptionView]];
}

- (IBAction)permissionPresentButtonDidPush:(id)sender
{
    if (self.permissionControl.selectedSegmentIndex == -1) {
        self.permissionControl.selectedSegmentIndex = 0;
    }
    
    YSAccessErrorDescriptionView *view = [self accountPermissionErrorDescriptionView];
    [self configureColorToErrorDescriptionView:view];
    [view show];
}

- (YSAccessErrorDescriptionView*)accountPermissionErrorDescriptionView
{
    switch (self.permissionControl.selectedSegmentIndex) {
        case 0:
            return [YSAccessErrorDescriptionView accountPermissionDeniedErrorWithSocialType:YSAccessErrorDescriptionSocialTypeTwitter];
        case 1:
            return [YSAccessErrorDescriptionView accountPermissionDeniedErrorWithSocialType:YSAccessErrorDescriptionSocialTypeFacebook];
        default:
            abort();
    }
}

#pragma mark -

- (IBAction)colorControlDidChange:(id)sender
{
    if (self.privacyControl.selectedSegmentIndex != -1) {
        [self privacyControlDidChange:self.privacyControl];
    } else if (self.zeroControl.selectedSegmentIndex != -1) {
        [self zeroControlDidChange:self.zeroControl];
    } else if (self.permissionControl.selectedSegmentIndex != -1) {
        [self permissionControlDidChange:self.permissionControl];
    }
}

- (void)configureColorToErrorDescriptionView:(YSAccessErrorDescriptionView*)view
{
    UIColor *bgColor, *textColor, *noteColor;
    switch (self.colorControl.selectedSegmentIndex) {
        case 0:
            bgColor = [UIColor whiteColor];
            textColor = [UIColor blackColor];
            noteColor = [UIColor redColor];
            break;
        case 1:
            bgColor = [UIColor lightGrayColor];
            textColor = [UIColor whiteColor];
            noteColor = [UIColor redColor];
            break;
        default:
            abort();
    }
    
    view.backgroundColor = bgColor;
    [view setTextColor:textColor noteColor:noteColor];
}

- (void)addErrorDescriptionView:(YSAccessErrorDescriptionView*)view
{
    for (UIView *view in self.descriptionContainerView.subviews) {
        [view removeFromSuperview];
    }
    
    [self configureColorToErrorDescriptionView:view];
    
    view.center = CGPointMake(self.descriptionContainerView.bounds.size.width/2.f,
                              self.descriptionContainerView.bounds.size.height/2.f);
    
    [self.descriptionContainerView addSubview:view];
}

@end
