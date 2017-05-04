//
//  SingleLineItem.h
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SingleLineItemRightType) {
    SingleLineItemRightTypeNone = 0,
    SingleLineItemRightTypeArrow,
    SingleLineItemRightTypeArrowAndCustomView,
    SingleLineItemRightTypeCheck,
    SingleLineItemRightTypeCheckAndCustomView,
    SingleLineItemRightTypeCustomView,
};


typedef void(^Operation)();

@interface SingleLineLayoutItem : NSObject

// 图标
@property (nonatomic, copy) NSString *icon;
// 图标模式，默认UIViewContentModeScaleToFill
@property (nonatomic, assign) UIViewContentMode iconMode;
// 图标宽，默认图片大小
@property (nonatomic, assign) CGFloat iconWidth;
// 图标左右间距，默认8
@property (nonatomic, assign) CGFloat iconMargin;

// 标题
@property (nonatomic, copy) NSString *title;
// 标题宽，默认0
@property (nonatomic, assign) CGFloat titleWidth;
// 标题左边间距，默认0，设置了titleMargin，图标与标题之间的间距即为titleMargin
@property (nonatomic, assign) CGFloat titleMargin;
// 标题主题，默认nil
@property (nonatomic, strong) NSDictionary *titleAttributes;

// 子标题
@property (nonatomic, copy) NSString *subtitle;
// 子标题文本格式，默认NSTextAlignmentRight
@property (nonatomic, assign) NSTextAlignment subtitleAlignment;
// 子标题主题，默认nil
@property (nonatomic, strong) NSDictionary *subTitleAttributes;

// 右侧自定义视图，默认nil
@property (nonatomic, strong) UIView *rightView;
// 右侧视图类型
@property (nonatomic, assign) SingleLineItemRightType rightType;

// 表格高度，默认0
@property (nonatomic, assign) CGFloat height;
// 点击操作，默认nil
@property (nonatomic, copy) Operation operation;

+ (instancetype)itemWithRightType:(SingleLineItemRightType)type;
+ (instancetype)itemWithSubTitle:(NSString *)subtitle rightType:(SingleLineItemRightType)type;
+ (instancetype)itemWithTitle:(NSString *)title rightType:(SingleLineItemRightType)type;
+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle rightType:(SingleLineItemRightType)type;
+ (instancetype)itemWithTitle:(NSString *)title icon:(NSString *)icon rightType:(SingleLineItemRightType)type;
+ (instancetype)itemWithTitle:(NSString *)title subtitle:(NSString *)subtitle icon:(NSString *)icon rightType:(SingleLineItemRightType)type;
@end
