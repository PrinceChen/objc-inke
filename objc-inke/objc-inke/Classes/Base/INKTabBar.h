//
//  INKTabBar.h
//  objc-inke
//
//  Created by prince.chen on 2017/3/4.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, INKItemType) {
    INKItemTypeLive = 100,
    INKItemTypeMe,
};


@class INKTabBar;

typedef void (^TabBlock) (INKTabBar *tabbar, INKItemType idx);

@protocol INKTabBarDelegate <NSObject>

- (void)tabBar: (INKTabBar *)tabBar clickButton: (INKItemType)idx;

@end

@interface INKTabBar : UIView

@property (nonatomic, weak) id<INKTabBarDelegate> delegate;
@property (nonatomic, copy) TabBlock block;
@end
