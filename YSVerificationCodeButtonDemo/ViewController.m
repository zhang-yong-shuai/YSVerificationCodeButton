//
//  ViewController.m
//  YSVerificationCodeButtonDemo
//
//  Created by zys on 2016/11/10.
//  Copyright © 2016年 张永帅. All rights reserved.
//

#import "ViewController.h"
#import "YSVerificationCodeButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
