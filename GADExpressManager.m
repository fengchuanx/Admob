//
//  GADExpressManager.m
//  PrivacyPhoto
//
//  Created by 冯 传祥 on 2017/6/10.
//  Copyright © 2017年 冯 传祥. All rights reserved.
//

#import "GADExpressManager.h"
@import GoogleMobileAds;

@interface GADExpressManager () <GADNativeExpressAdViewDelegate, GADVideoControllerDelegate>

@end

@implementation GADExpressManager

- (instancetype)initWithFrame:(CGRect)frame
                   controller:(UIViewController *)controller
                     adUnitID:(NSString *)adUnitID
                   edgeInsets:(UIEdgeInsets)edgeInsets
{
    self = [super initWithFrame:frame];
    if (self) {
        //360 * 320
        CGRect adFrame = CGRectMake(edgeInsets.left, edgeInsets.top, frame.size.width - edgeInsets.left - edgeInsets.right, frame.size.height - edgeInsets.top - edgeInsets.bottom);
        GADNativeExpressAdView *adView = [[GADNativeExpressAdView alloc]
                                          initWithAdSize:GADAdSizeFromCGSize(adFrame.size) origin:adFrame.origin];
        //    adView.adUnitID = @"ca-app-pub-5190734310507136/8304096003";
        adView.adUnitID = adUnitID;
        adView.rootViewController = controller;
        adView.delegate = self;
        [self addSubview:adView];
        
        GADRequest *request = [GADRequest request];
#ifdef DEBUG
        request.testDevices = @[ kGADSimulatorID, @"f8bb43a77f9144ab3000965d8f795a2b"];
#endif
        [adView loadRequest:request];
    }
    return self;
}

#pragma mark - GADNativeExpressAdViewDelegate, GADVideoControllerDelegate
- (void)nativeExpressAdViewDidReceiveAd:(GADNativeExpressAdView *)nativeExpressAdView {
    
    if (_finishHandle) {
        _finishHandle();
    }
}

- (void)nativeExpressAdView:(GADNativeExpressAdView *)nativeExpressAdView
didFailToReceiveAdWithError:(GADRequestError *)error {
    // Load the next ad in the adsToLoad list.
    //    [self preloadNextAd];
}

#pragma mark - GADVideoControllerDelegate

- (void)videoControllerDidEndVideoPlayback:(GADVideoController *)videoController {

}

@end
