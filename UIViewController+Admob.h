//
//  UIViewController+Admob.h
//  Advert
//
//  Created by 冯 传祥 on 2017/1/2.
//  Copyright © 2017年 冯 传祥. All rights reserved.
//

#import <UIKit/UIKit.h>
//@import GoogleMobileAds;
#import <GoogleMobileAds/GoogleMobileAds.h>

@interface UIViewController (Admob) <GADBannerViewDelegate>

@property (nonatomic, copy) dispatch_block_t success;

- (void)showAdmobBanner:(CGRect)frame
               adUnitID:(NSString *)adUnitID;

- (void)showAdmobBanner:(CGRect)frame
               adUnitID:(NSString *)adUnitID
                success:(dispatch_block_t)success;

- (void)showAdmobBanner:(CGRect)frame
               adUnitID:(NSString *)adUnitID
              superView:(UIView *)superView
                success:(dispatch_block_t)success;

@end
