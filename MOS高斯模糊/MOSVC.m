//
//  MOSVC.m
//  MOS高斯模糊 Gaussian Blur
//
//  Created by mac on 15/4/29.
//  Copyright (c) 2015年 JerryWonder. All rights reserved.
//



#import "MOSVC.h"
#import "UIColor+Colours.h"
@interface MOSVC ()
@property(nonatomic,strong)UIImageView * image;
@property(nonatomic,strong)UIButton * button;
@property(nonatomic,strong)UIVisualEffectView * vi;
@property(nonatomic)NSInteger amazingValue;
@end

@implementation MOSVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self creatUI];
    
}

-(void)creatUI
{
    self.amazingValue = 11;
    self.image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"grasses"]];
    self.image.frame = self.view.frame;
    self.image.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.image];
    self.button = [self sampleShadowButtonWithX:110 Y:200 Width:100 Height:100 ShadowColor:[UIColor buttermilkColorWithAlpha:1] Sel:@selector(Gaussian:)];
    [self.button setTitle:@"Press Me" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor buttermilkColorWithAlpha:1] forState:UIControlStateNormal];
    [self.view addSubview:self.button];
}
#pragma mark - Add Gaussian Blur
-(void)Gaussian:(UIButton *)button{
    if (self.amazingValue%2) {
        /**
         如果你想选择高斯模糊的风格
                            你可以Comman加左键点击这里⬇️
         Press Comman + left Click here ➡️ UIBlurEffectStyle ⬅️
         That you can selete the Gaussian Blur Style
         */
        self.vi = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight/*⬅️style paste here 风格枚举复制到这里*/]];
        
        self.vi.frame = CGRectMake(-self.view.frame.size.width,0, self.view.frame.size.width, self.view.frame.size.height);
        self.vi.alpha = 0;
        [UIView animateWithDuration:1 animations:^{
            self.vi.frame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height);
            self.vi.alpha = 0.9;
        }];
        [self.image addSubview:self.vi];
        [button setTitle:@"" forState:UIControlStateNormal];
        button.backgroundColor = [UIColor buttermilkColorWithAlpha:.8];
        self.amazingValue++;
    }else{
        [button setTitle:@"Press Me" forState:UIControlStateNormal];

        button.backgroundColor = [UIColor clearColor];
        [self.vi removeFromSuperview];
        self.amazingValue++;
    }

}

-(UIButton *)sampleShadowButtonWithX:(CGFloat)x
                                   Y:(CGFloat)y
                               Width:(CGFloat)width
                              Height:(CGFloat)height
                         ShadowColor:(UIColor *)shadowColor
                                 Sel:(SEL)sel
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.backgroundColor = [UIColor grassColorWithAlpha:0];
    button.frame = CGRectMake(x, y, width, height);
    button.layer.cornerRadius = 50;
    button.layer.shadowColor = shadowColor.CGColor;
    button.layer.shadowOffset = CGSizeMake(0, 0);
    button.layer.shadowRadius = 10;
    button.layer.shadowOpacity = 0.8;
    [button addTarget:self action:sel forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
