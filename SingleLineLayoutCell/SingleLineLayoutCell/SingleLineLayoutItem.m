//
//  SKSingleLineItem.m
//
//

#import "SingleLineLayoutItem.h"

@implementation SingleLineLayoutItem

+ (instancetype)itemWithRightType:(SingleLineItemRightType)type {
    return [self itemWithTitle:nil subtitle:nil icon:nil rightType:type];
}

+ (instancetype)itemWithSubTitle:(NSString *)subtitle rightType:(SingleLineItemRightType)type {
    return [self itemWithTitle:nil subtitle:subtitle icon:nil rightType:type];
}

+ (instancetype)itemWithTitle:(NSString *)title rightType:(SingleLineItemRightType)type {
    return [self itemWithTitle:title subtitle:nil icon:nil rightType:type];
}

+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle rightType:(SingleLineItemRightType)type {
    return [self itemWithTitle:title subtitle:subtitle icon:nil rightType:type];
}

+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon rightType:(SingleLineItemRightType)type {
    return [self itemWithTitle:title subtitle:nil icon:icon rightType:type];
}

+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle icon:(NSString *)icon rightType:(SingleLineItemRightType)type {
    SingleLineLayoutItem *item = [[self alloc] init];
    item.icon = icon;
    item.title = title;
    item.subtitle = subtitle;
    item.rightType = type;
    // 默认设置
    item.iconMode = UIViewContentModeScaleToFill;
    item.iconMargin = 8;
    item.iconWidth = 0;
    item.titleMargin = 0;
    item.subtitleAlignment = NSTextAlignmentRight;
    return item;
}

@end
