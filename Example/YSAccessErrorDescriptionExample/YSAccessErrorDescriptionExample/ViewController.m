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

@property (weak, nonatomic) IBOutlet UISegmentedControl *accountErrorControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *socialControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *photosErrorControl;

@property (nonatomic) UIView *descriptionView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self accountErrorControlDidChange:self.accountErrorControl];
}

- (void)addDescriptionView:(YSAccessErrorDescriptionView*)view
{
    [self.descriptionView removeFromSuperview];
    
    view.backgroundColor = [UIColor lightGrayColor];
    [view setTextColor:[UIColor whiteColor] noteColor:[UIColor redColor]];
    
    CGRect f = view.frame;
    f.origin.y = CGRectGetMaxY(self.photosErrorControl.frame) + 20.f;
    view.frame = f;
    [self.view addSubview:view];
    
    self.descriptionView = view;
}

- (IBAction)accountErrorControlDidChange:(UISegmentedControl *)sender
{
    NSString *typeID;
    switch (self.socialControl.selectedSegmentIndex) {
        case 0:
            typeID = ACAccountTypeIdentifierTwitter;
            break;
        case 1:
            typeID = ACAccountTypeIdentifierFacebook;
            break;
        default:
            abort();
            break;
    }
    
    YSAccessErrorDescriptionView *descView;
    switch (sender.selectedSegmentIndex) {
        case 0:
            descView = [YSAccessErrorDescriptionView accountPrivacyErrorViewWithAccountTypeIdentifier:typeID];
            break;
        case 1:
            descView = [YSAccessErrorDescriptionView accountZeroErrorWithAccountTypeIdentifier:typeID];
            break;
        case 2:
            descView = [YSAccessErrorDescriptionView accountPermissionDeniedErrorWithAccountTypeIdentifier:typeID];
            break;
        default:
            abort();
    }
    [self addDescriptionView:descView];
}

- (IBAction)socialControlDidChange:(UISegmentedControl *)sender
{
    [self accountErrorControlDidChange:self.accountErrorControl];
}

- (IBAction)photosErrorControlDidChange:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self.descriptionView removeFromSuperview];
            self.descriptionView = nil;
            break;
        case 1:
            [self addDescriptionView:[YSAccessErrorDescriptionView photosPrivacyErrorViewWithAppIconImage:[self appIconImage]]];
            break;
        default:
            abort();
            break;
    }
}

#pragma mark - Utility

- (UIImage*)appIconImage
{
    return [UIImage imageNamed:@"app-icon"];
}

@end
