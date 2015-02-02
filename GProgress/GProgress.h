//
//  GProgress.h
//  GProgress
//
//  Created by __无邪_ on 15/2/2.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>
#import <iToast.h>

#define Progress [GProgress sharedManager]

@interface GProgress : NSObject
@property (nonatomic, strong) MBProgressHUD *HUD;


+ (instancetype)sharedManager;

- (void)showProgress;//只有菊花的
- (void)showProgressWithTextAutoHide:(NSString *)text;
- (void)showProgressWithText:(NSString *)text dealy:(NSTimeInterval)dealy;

- (void)showTextAutoHide:(NSString *)text;//只有文字的
- (void)showText:(NSString *)text dealy:(NSTimeInterval)dealy;

- (void)showText:(NSString *)text onView:(UIView *)view;

- (void)hide;
- (void)hideAfterDelay:(NSTimeInterval)dealy;







/* iToast Progress 不会阻塞线程 */

- (void)showToastWithText:(NSString *)text position:(iToastGravity)gravity;







@end
