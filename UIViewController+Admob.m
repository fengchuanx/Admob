//
//  UIViewController+Admob.m
//  Advert
//
//  Created by 冯 传祥 on 2017/1/2.
//  Copyright © 2017年 冯 传祥. All rights reserved.
//

#import "UIViewController+Admob.h"
#import <objc/runtime.h>

@implementation UIViewController (Admob)

#pragma mark - Admob

- (void)showAdmobBanner:(CGRect)frame
               adUnitID:(NSString *)adUnitID {
    [self showAdmobBanner:frame adUnitID:adUnitID superView:self.view success:nil];
}

- (void)showAdmobBanner:(CGRect)frame
               adUnitID:(NSString *)adUnitID
                success:(dispatch_block_t)success {
    [self showAdmobBanner:frame adUnitID:adUnitID superView:self.view success:success];
}

- (void)showAdmobBanner:(CGRect)frame
               adUnitID:(NSString *)adUnitID
              superView:(UIView *)superView
                success:(dispatch_block_t)success {
    self.success = success;
    self.mobbannerView.frame = frame;
    self.mobbannerView.delegate = self;
    self.mobbannerView.adUnitID = adUnitID;
    self.mobbannerView.rootViewController = self;
    GADRequest *request = [GADRequest request];
#ifdef DEBUG
    request.testDevices = @[
                            @"kGADSimulatorID",
                            @"f8231c85289a86089a541f6318fe5e5f",  // iphone4s
                            @"f8b4c976eaaf84ec7ca039fdf5aa5a1e"
                            ];
#endif
    
    [self.mobbannerView loadRequest:request];
    [superView addSubview:self.mobbannerView];
}

#pragma mark - GADBannerViewDelegate

- (void)adViewDidReceiveAd:(GADBannerView *)bannerView;
{
    if (self.success) {
        self.success();
    }
    //    NSLog(@"%s", __func__);
}
/// Tells the delegate that an ad request failed. The failure is normally due to network
/// connectivity or ad availablility (i.e., no fill).
- (void)adView:(GADBannerView *)bannerView didFailToReceiveAdWithError:(GADRequestError *)error; {
    //    NSLog(@"%s info%@", __func__, error.localizedDescription);
}

- (GADBannerView *)mobbannerView {
    GADBannerView *mobBannerView = objc_getAssociatedObject(self, _cmd);
    if (!mobBannerView) {
        mobBannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
        self.mobbannerView = mobBannerView;
    }
    return mobBannerView;
}

- (void)setMobbannerView:(GADBannerView *)mobbannerView {
    objc_setAssociatedObject(self, @selector(mobbannerView), mobbannerView, OBJC_ASSOCIATION_RETAIN);
}

- (dispatch_block_t)success {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setSuccess:(dispatch_block_t)success {
    objc_setAssociatedObject(self, @selector(success), success, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
