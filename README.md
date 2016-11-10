# YSVerificationCodeButton
YSVerificationCodeButton验证码倒计时按钮。
调用示例：
```
YSVerificationCodeButton *codeButton = [[YSVerificationCodeButton alloc] initWithFrame:CGRectMake(100, 200, 110, 30)];
    [self.view addSubview:codeButton];
    __weak typeof (codeButton) weakButton = codeButton;
    codeButton.clickedAction = ^ {
        //[YSRequest requestSMSCode:[weakself.phoneNumberInput.text trime] success:^(id responseObject) {
            //PD_HUD_YES(@"验证码发送成功");
            [weakButton startCountdown];
        //} failure:^(NSString *errorMessage) {
            //PD_HUD_NO(errorMessage);
            // 发送失败，需要重置按钮状态
            //[weakButton resetCodeButton];
        //}];
    };
```
