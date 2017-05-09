//
//  TextInputItem.h
//  Copyright © 2017年 YeLiang. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    TextInputTextField,
    TextInputTextView,
} TextInputType;

@interface TextInputItem : NSObject
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *text;
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,assign) UIKeyboardType keyboardType;
@property (nonatomic,assign) TextInputType textInputType;

+ (instancetype)textInputItemWithPlaceholder:(NSString *)placeholder text:(NSString *)text;
+ (instancetype)textInputItemWithWithTitle:(NSString *)title Placeholder:(NSString *)placeholder text:(NSString *)text;
+ (instancetype)textInputItemWithPlaceholder:(NSString *)placeholder text:(NSString *)text textInputType:(TextInputType)textInputType;

+ (instancetype)textInputItemWithTitle:(NSString *)title Placeholder:(NSString *)placeholder textInputType:(TextInputType)textInputType;

+ (instancetype)textInputItemWithTitle:(NSString *)title Placeholder:(NSString *)placeholder text:(NSString *)text textInputType:(TextInputType)textInputType;
@end
