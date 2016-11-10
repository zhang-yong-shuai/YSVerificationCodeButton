//
//  YSVerificationCodeButton.h
//  YSVerificationCodeButtonDemo
//
//  Created by ZhangYongShuai on 16/8/20.
//  Copyright © 2016年 XinYiChangXiang. All rights reserved.
//

/**
 *  验证码button
 */

#import <UIKit/UIKit.h>

typedef void (^YSVoidCallBackBlock) ();

@interface YSVerificationCodeButton : UIView

@property (nonatomic, readonly) UIButton *button;
@property (nonatomic, copy) YSVoidCallBackBlock clickedAction;

- (void)startCountdown;
- (void)resetCodeButton;

@end
