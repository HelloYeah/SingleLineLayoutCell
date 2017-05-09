//
//  TextInputCell.m
//  Copyright © 2017年 YeLiang. All rights reserved.
//

#import "TextInputCell.h"
#import "UIView+Frame.h"

#define  kContentLeftAndRightMargin 12.5

@interface TextInputCell () <UITextViewDelegate>
@property (nonatomic,strong) UIView *textInputView;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation TextInputCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}


- (BOOL)becomeFirstResponder {
    
    [self.textInputView becomeFirstResponder];
    return YES;
}

- (void)setTextInputItem:(TextInputItem *)textInputItem {
    
    _textInputItem = textInputItem;
    
    self.titleLabel.text = textInputItem.title;

    [self.textInputView removeFromSuperview];
    if (textInputItem.textInputType == TextInputTextField) {
        
        UITextField *textField = [self textField];
        textField.placeholder = textInputItem.placeholder;
        textField.text = textInputItem.text;
        textField.keyboardType = textInputItem.keyboardType;
        self.textInputView = textField;
        [self.contentView addSubview:self.textInputView];
       
    }else {
        UITextView *textView = [self textView];
        textView.keyboardType = textInputItem.keyboardType;
        textView.text = textInputItem.text;
        self.textInputView = textView;
        [self.contentView addSubview:self.textInputView];
    }
    
    [self.titleLabel sizeToFit];
    self.titleLabel.left = kContentLeftAndRightMargin;
    self.textInputView.left = self.titleLabel.right;
}

#pragma mark - delegate

- (void)textViewDidBeginEditing:(UITextView *)textView {

    if (self.textInputChange) {
        self.textInputChange();
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    
    self.textInputItem.text = textView.text;
    if ([self.delegate respondsToSelector:@selector(textInputCellTextChange:)]) {
        [self.delegate textInputCellTextChange:textView.text];
    }
}

- (void)textFieldEdit:(UITextField *)textField {
    
    self.textInputItem.text = textField.text;
    
    if (self.textInputChange) {
        self.textInputChange();
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(textInputCellTextChange:)]) {
        [self.delegate textInputCellTextChange:textField.text];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    self.titleLabel.centerY = self.height * 0.5;
    self.textInputView.width = self.width - 2 * kContentLeftAndRightMargin - self.titleLabel.width;
    if (self.textInputItem.textInputType == TextInputTextField) {
        self.textInputView.height = self.height;
        self.textInputView.top = 0;
    }else {
        self.textInputView.height = self.height - 10;
        self.textInputView.top = 5;
    }
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor darkTextColor];
    }
    return _titleLabel;
}

- (UITextField *)textField {
    
    UITextField *textField = [[UITextField alloc] init];

    [textField addTarget:self action:@selector(textFieldEdit:) forControlEvents:UIControlEventAllEditingEvents];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.font = [UIFont systemFontOfSize:15];
    textField.textColor = [UIColor darkTextColor];
    return textField;
}

- (UITextView *)textView {
    
    UITextView *textView = [[UITextView alloc] init];
    textView.delegate = self;
    [textView setTextContainerInset:UIEdgeInsetsMake(5, 3, 5, 3)];
    textView.clearsOnInsertion = YES;
    textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    textView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
    textView.font = [UIFont systemFontOfSize:15];
    textView.textColor = [UIColor darkTextColor];
    return textView;
}

@end
