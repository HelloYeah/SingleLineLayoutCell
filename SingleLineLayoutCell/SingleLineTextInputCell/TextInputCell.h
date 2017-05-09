//
//  TextInputCell.h
//  Copyright © 2017年 YeLiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TextInputItem.h"

@protocol TextInputCellDelegate <NSObject>
- (void)textInputCellTextChange:(NSString *)InputText;
@end

@interface TextInputCell : UITableViewCell
@property (nonatomic,strong) TextInputItem *textInputItem;
@property (nonatomic,weak) id<TextInputCellDelegate> delegate;
@property (nonatomic,copy) void(^textInputChange)();
- (BOOL)becomeFirstResponder;
@end
