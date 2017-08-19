//
//  GADExpressManager.h
//  PrivacyPhoto
//
//  Created by 冯 传祥 on 2017/6/10.
//  Copyright © 2017年 冯 传祥. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GADExpressManager : UIView

@property (nonatomic, copy) dispatch_block_t finishHandle;//广告加载成功回调

- (instancetype)initWithFrame:(CGRect)frame
                   controller:(UIViewController *)controller
                     adUnitID:(NSString *)adUnitID
                   edgeInsets:(UIEdgeInsets)edgeInsets;
@end
