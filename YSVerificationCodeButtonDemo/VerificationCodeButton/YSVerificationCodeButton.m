//
//  YSVerificationCodeButton.m
//  YSVerificationCodeButtonDemo
//
//  Created by ZhangYongShuai on 16/8/20.
//  Copyright © 2016年 XinYiChangXiang. All rights reserved.
//

#import "YSVerificationCodeButton.h"

NSInteger const kCountdownSeconds = 5;
#define kEnableButtonBgColor [UIColor redColor]
#define kDisableButtonBgColor [UIColor lightGrayColor]

@interface YSVerificationCodeButton ()

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger seconds;

@end

@implementation YSVerificationCodeButton

#pragma mark - reset button
- (void)resetCodeButton {
    [self stopCountdown];
    // reset status
    self.button.userInteractionEnabled = YES;
    self.button.backgroundColor = kEnableButtonBgColor;
    self.seconds = kCountdownSeconds;
    [self.button setTitle:@"重新获取验证码" forState:UIControlStateNormal];
}

#pragma mark - init method
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.seconds = kCountdownSeconds;
        [self placeSubviews:CGRectMake(0, 0, frame.size.width, frame.size.height)];
    }
    return self;
}

- (void)dealloc {
    if (self.timer && [self.timer isValid]) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark - layout
- (void)placeSubviews:(CGRect)frame {
    self.button.frame = frame;
}

#pragma mark - getters
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton new];
        [self addSubview:_button];
        [_button setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        _button.backgroundColor = kEnableButtonBgColor;
        _button.layer.cornerRadius = 5.0f;
        [_button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}

- (NSTimer *)timer {
    if (!_timer) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countdown:) userInfo:nil repeats:YES];
    }
    return _timer;
}

#pragma mark - button action
- (void)buttonClicked:(UIButton *)button {
    if (self.clickedAction) {
        self.clickedAction ();
    }
}

- (void)countdown:(NSTimer *)timer {
    [self updateButtonState];
    self.seconds--;
}

#pragma mark - update button title
- (void)updateButtonState {
    if (self.seconds > 0) {
        NSString *title = [NSString stringWithFormat:@"%lds", (long)self.seconds];
        [self.button setTitle:title forState:UIControlStateNormal];
        self.button.userInteractionEnabled = NO;
        self.button.backgroundColor = kDisableButtonBgColor;
    } else {
        [self resetCodeButton];
    }
}

- (void)startCountdown {
    [self.timer setFireDate:[NSDate distantPast]];
}

- (void)stopCountdown {
    [self.timer setFireDate:[NSDate distantFuture]];
    [self.timer invalidate];
    self.timer = nil;
}

@end
