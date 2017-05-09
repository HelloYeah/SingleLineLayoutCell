
//
//  TextInputItem.m
//  Copyright © 2017年 YeLiang. All rights reserved.
//

#import "TextInputItem.h"

@implementation TextInputItem
+ (instancetype)textInputItemWithPlaceholder:(NSString *)placeholder text:(NSString *)text {

    return [self textInputItemWithPlaceholder:placeholder text:text textInputType:TextInputTextField];
}

+ (instancetype)textInputItemWithWithTitle:(NSString *)title Placeholder:(NSString *)placeholder text:(NSString *)text {
    return [self textInputItemWithTitle:title Placeholder:placeholder text:text textInputType:TextInputTextField];
}

+ (instancetype)textInputItemWithPlaceholder:(NSString *)placeholder text:(NSString *)text textInputType:(TextInputType)textInputType {
    
    return [self textInputItemWithTitle:nil Placeholder:placeholder text:text textInputType:TextInputTextField];
}


+ (instancetype)textInputItemWithTitle:(NSString *)title Placeholder:(NSString *)placeholder textInputType:(TextInputType)textInputType {

    return [self textInputItemWithTitle:title Placeholder:placeholder text:nil textInputType:textInputType];
}

+ (instancetype)textInputItemWithTitle:(NSString *)title Placeholder:(NSString *)placeholder text:(NSString *)text textInputType:(TextInputType)textInputType {
    
    TextInputItem *item = [[TextInputItem alloc] init];
    item.title = title;
    item.placeholder = placeholder;
    item.text = text;
    item.textInputType = textInputType;
    return item;
}
@end
