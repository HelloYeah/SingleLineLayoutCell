//
//  SingleLineLayoutCell.m
//
//
#import <UIKit/UIKit.h>
#import "SingleLineLayoutCell.h"
#import "SingleLineLayoutItem.h"
#import "UIView+Frame.h"

@interface SingleLineLayoutCell ()

@property (strong, nonatomic)  UIImageView *iconView;
@property (strong, nonatomic)  UILabel *titleLabel;
@property (strong, nonatomic)  UILabel *subTitleLabel;
@property (strong, nonatomic)  UIView *rightView;
@end

@implementation SingleLineLayoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
         [self.contentView addSubview:self.titleLabel];
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)]];
    }
    return self;
}


- (void)click:(UIGestureRecognizer *)tap {
    
    if (self.recordSingleLineItem.operation) {
        self.recordSingleLineItem.operation();
    }
}

- (void)setRecordSingleLineItem:(SingleLineLayoutItem *)singleLineItem {

    _recordSingleLineItem = singleLineItem;
    
    CGFloat contentLeft = 12.5;
    /*********************** 图标 ***********************/
    UIImage *image = (singleLineItem.icon) ? [UIImage imageNamed:singleLineItem.icon] : nil;
    if(singleLineItem.icon && image) {
        
        [self.contentView addSubview:self.iconView];
        self.iconView.image = image;
        self.iconView.contentMode = singleLineItem.iconMode;
        self.iconView.left = contentLeft;
        if (singleLineItem.iconWidth > 0) {
            self.iconView.size = CGSizeMake(singleLineItem.iconWidth, singleLineItem.iconWidth);
        }else {
            [self.iconView sizeToFit];
        }
        contentLeft = self.iconView.right + singleLineItem.iconMargin;
    }else {
        [self resetSubview:_iconView];
    }
    
    /*********************** 标题 ***********************/
    
    if (singleLineItem.title && singleLineItem.titleAttributes) {
        self.titleLabel.attributedText = [[NSAttributedString alloc] initWithString:singleLineItem.title attributes:singleLineItem.titleAttributes];
    } else {
        self.titleLabel.text = singleLineItem.title;
    }
    
    self.titleLabel.size = [self.titleLabel sizeThatFits:CGSizeMake(self.width * 0.45, self.height)];
    self.titleLabel.left = contentLeft;
    self.titleLabel.width = MIN(self.titleLabel.width, self.width * 0.6);
    contentLeft = self.titleLabel.right + 2;
    
    
    /*********************** 子标题 ***********************/
    if (singleLineItem.subtitle) {
        
        [self.contentView addSubview:self.subTitleLabel];
        if (singleLineItem.subTitleAttributes) {
            self.subTitleLabel.attributedText = [[NSAttributedString alloc] initWithString:singleLineItem.subtitle attributes:singleLineItem.subTitleAttributes];
        }else {
            self.subTitleLabel.text = singleLineItem.subtitle;
        }
        [self.subTitleLabel sizeToFit];
        self.subTitleLabel.left = contentLeft;
        self.subTitleLabel.width = MIN(self.subTitleLabel.width, self.width * 0.4);
        contentLeft = self.subTitleLabel.right;
        
    }else {
        [self resetSubview:_subTitleLabel];
    }
    
    /*********************** 右侧视图 ***********************/
    
    [self resetSubview:_rightView];
    
    SingleLineItemRightType type = singleLineItem.rightType;
    switch (type) {
        case SingleLineItemRightTypeNone:
            self.accessoryType = UITableViewCellAccessoryNone;
            break;
        case SingleLineItemRightTypeArrow:
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case SingleLineItemRightTypeArrowAndCustomView:
            [self.contentView addSubview:self.rightView];
            [self.rightView addSubview:singleLineItem.rightView];
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        case SingleLineItemRightTypeCheck:
            self.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case SingleLineItemRightTypeCheckAndCustomView:
            [self.contentView addSubview:self.rightView];
            [self.rightView addSubview:singleLineItem.rightView];
            self.accessoryType = UITableViewCellAccessoryCheckmark;
            break;
        case SingleLineItemRightTypeCustomView:
            [self.contentView addSubview:self.rightView];
            [self.rightView addSubview:singleLineItem.rightView];
            self.accessoryType = UITableViewCellAccessoryNone;
            break;
        default:
            self.accessoryType = UITableViewCellAccessoryNone;
            break;
    }
}

- (void)setRightViewFrame {

    self.rightView.size = self.recordSingleLineItem.rightView.size;
    self.rightView.centerY = self.height * 0.5;
    
    SingleLineItemRightType type = self.recordSingleLineItem.rightType;
    switch (type) {
    
        case SingleLineItemRightTypeArrowAndCustomView:
             self.rightView.right = self.contentView.width;
            break;
        case SingleLineItemRightTypeCheckAndCustomView:
             self.rightView.right = self.contentView.width;
            break;
        case SingleLineItemRightTypeCustomView:
            self.rightView.right = self.contentView.width - 12.5;
            break;
        default:
            break;
    }
}

- (UIImageView *)iconView {
    
    if (!_iconView) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)titleLabel {
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.font = [UIFont systemFontOfSize:12];
        _subTitleLabel.textColor = [UIColor lightGrayColor];
    }
    return _subTitleLabel;
}

- (UIView *)rightView {
    
    if (!_rightView) {
        _rightView = [[UIView alloc] init];
    }
    return _rightView;
}

- (void)resetSubview:(UIView *)view {
    
    if (view) {
        [view removeFromSuperview];
        view = nil;
    }
}

- (void)setSubviewCenterY:(UIView *)view {
    
    if (view) {
        view.centerY = self.height * 0.5;
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    [self setSubviewCenterY:_titleLabel];
    [self setSubviewCenterY:_iconView];
    [self setSubviewCenterY:_subTitleLabel];
    [self setSubviewCenterY:_rightView];
    if (_rightView) {
        [self setRightViewFrame];
    }
}

@end




