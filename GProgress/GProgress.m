//
//  GProgress.m
//  GProgress
//
//  Created by __无邪_ on 15/2/2.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "GProgress.h"

#define kAutoHideDealy 1.4

@interface GProgress ()
@end

@implementation GProgress

+ (instancetype)sharedManager{
    static GProgress *progress = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        progress = [[GProgress alloc] init];
    });
    return progress;
}

#////////////////////////////////////////////////////////////////////////////////
#pragma mark - Show
////////////////////////////////////////////////////////////////////////////////


- (void)showProgress{ //只有菊花的
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.HUD show:YES];
        [_HUD hide:YES afterDelay:100];
    });
}
- (void)showProgressWithTextAutoHide:(NSString *)text{
    [self showProgressWithText:text dealy:kAutoHideDealy];
}
- (void)showProgressWithText:(NSString *)text dealy:(NSTimeInterval)dealy{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.HUD setMode:MBProgressHUDModeIndeterminate];
        NSString *fixText = text?:@"";
        _HUD.detailsLabelText = fixText;
        _HUD.detailsLabelFont = [UIFont systemFontOfSize:15];
        [_HUD show:YES];
        [_HUD hide:YES afterDelay:dealy];
    });
}


- (void)showTextAutoHide:(NSString *)text{ //只有文字的
    [self showText:text dealy:kAutoHideDealy];
}
- (void)showText:(NSString *)text dealy:(NSTimeInterval)dealy{
    dispatch_async(dispatch_get_main_queue(), ^{
        self.HUD.mode = MBProgressHUDModeText;
        NSString *fixText = text?:@"";
        _HUD.detailsLabelText = fixText;
        _HUD.detailsLabelFont = [UIFont systemFontOfSize:15];
        [_HUD show:YES];
        [_HUD hide:YES afterDelay:dealy];
    });
}

- (void)showText:(NSString *)text onView:(UIView *)view{ //自定义view
    [self hide];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    // Configure CustomView
    UILabel *backg = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 80)];
    backg.backgroundColor = [UIColor whiteColor];
    backg.textAlignment = NSTextAlignmentCenter;
    backg.textColor = [UIColor darkGrayColor];
    backg.layer.cornerRadius = 10;
    backg.layer.masksToBounds = YES;
    
    NSString *fixText = text?:@"";
    backg.text = fixText;
    
    hud.margin = 0.f;
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = backg;
    hud.dimBackground = NO;
    hud.removeFromSuperViewOnHide = YES;
    hud.animationType = MBProgressHUDAnimationZoom;
    
    [hud hide:YES afterDelay:3];
    
}


#////////////////////////////////////////////////////////////////////////////////
#pragma mark - Hide
////////////////////////////////////////////////////////////////////////////////


- (void)hide{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.HUD hide:YES];
    });
}

- (void)hideAfterDelay:(NSTimeInterval)dealy{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.HUD hide:YES afterDelay:dealy];
    });
}


#////////////////////////////////////////////////////////////////////////////////
#pragma mark - HUD Progress
////////////////////////////////////////////////////////////////////////////////

- (MBProgressHUD *)HUD{
    [_HUD removeFromSuperview];
    _HUD = nil;
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    _HUD = [[MBProgressHUD alloc] initWithWindow:window];
    [window addSubview:_HUD];
    _HUD.delegate = nil;
    _HUD.margin = 10.f;
    _HUD.dimBackground = NO;
    _HUD.minSize = CGSizeMake(100, 40);
    _HUD.removeFromSuperViewOnHide = YES;
    _HUD.minShowTime = 1.2;
    _HUD.animationType = MBProgressHUDAnimationZoom;
    return _HUD;
}












#////////////////////////////////////////////////////////////////////////////////
#pragma mark - iToast
////////////////////////////////////////////////////////////////////////////////

- (void)showToastWithText:(NSString *)text position:(iToastGravity)gravity{
    dispatch_async(dispatch_get_main_queue(), ^{
        iToast *toast = [iToast makeText:text];
        toast = [toast setDuration:1400];
        [[toast setGravity:gravity] show];
    });
}












@end
