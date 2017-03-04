//
//  INKTabBar.m
//  objc-inke
//
//  Created by prince.chen on 2017/3/4.
//  Copyright © 2017年 prince.chen. All rights reserved.
//

#import "INKTabBar.h"


@interface INKTabBar()

@property (nonatomic, strong) UIImageView *tabBgView;

@property (nonatomic, strong) NSArray *datalist;

@end

@implementation INKTabBar

- (UIImageView *)tabBgView {
    if (!_tabBgView) {
        _tabBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_searchbox_bg"]];
    }
    
    return _tabBgView;
}

- (NSArray *)datalist {
    if (!_datalist) {
        _datalist = @[@"tab_live", @"tab_me"];
    }
    
    return _datalist;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.tabBgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width / self.datalist.count;
    
    for (NSInteger i = 0; i < [self subviews].count; i++) {
        UIView *btn = [self subviews][i];
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.frame = CGRectMake((btn.tag - INKItemTypeLive) * width, 0, width, self.frame.size.height);
        }
    }
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.tabBgView];
        
        for (NSInteger i = 0; i < self.datalist.count; i++) {
            UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
            [item setImage:[UIImage imageNamed:self.datalist[i]]  forState: UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"]]  forState: UIControlStateHighlighted];
            
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            
            item.tag = INKItemTypeLive + i;
            
            [self addSubview: item];
        }
    }
    
    return self;
}

- (void)clickItem:(UIButton *)button {
    if ([self.delegate respondsToSelector:@selector(tabBar:clickButton:)]) {
        [self.delegate tabBar:self clickButton:button.tag];
    }
    
    
    if (self.block) {
        self.block(self, button.tag);
    }
}

@end
