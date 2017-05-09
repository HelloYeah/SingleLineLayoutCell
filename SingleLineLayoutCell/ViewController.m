//
//  ViewController.m
//  SingleLineLayoutCell
//
//  Created by Sekorm on 2017/5/4.
//  Copyright © 2017年 YL. All rights reserved.
//

#import "ViewController.h"
#import "SingleLineLayoutCell.h"
#import "SingleLineLayoutItem.h"
#import "UIView+Frame.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[SingleLineLayoutCell class] forCellReuseIdentifier:@"SingleLineLayoutCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SingleLineLayoutCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SingleLineLayoutCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    SingleLineLayoutItem *item = self.dataArray[indexPath.row];
    cell.recordSingleLineItem = item;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
}

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
        
        {
            SingleLineLayoutItem *item0 = [SingleLineLayoutItem itemWithTitle:@"弹窗" subtitle:@"subtitle" icon:@"3" rightType:SingleLineItemRightTypeArrow];
            item0.iconWidth = 30;
            item0.operation = ^{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"It is so cool" message:@"Hello World !!! " delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alertView show];
            };
            [_dataArray addObject:item0];
        }
        
        {
            SingleLineLayoutItem *item1 = [SingleLineLayoutItem itemWithTitle:@"push到下一控制器" rightType:SingleLineItemRightTypeArrow];
            __weak typeof(self) weakSelf = self;
            item1.operation = ^{
                UIViewController *vc = [[UIViewController alloc] init];
                vc.view.backgroundColor = [UIColor cyanColor];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
            [_dataArray addObject:item1];
        }
        
        {
            SingleLineLayoutItem *item2 = [SingleLineLayoutItem itemWithTitle:@"标题2" subtitle:@"the subtitle length is so long . oh my god" icon:@"4" rightType:SingleLineItemRightTypeCustomView];
            item2.iconWidth = 30;
            UIImageView *icon = [[UIImageView alloc] init];
            icon.image = [UIImage imageNamed:@"4"];
            icon.size = CGSizeMake(30, 30);
            item2.rightView = icon;
            [_dataArray addObject:item2];
        }
        
        {
            SingleLineLayoutItem *item3 = [SingleLineLayoutItem itemWithTitle:@"这个标题有点长。真的有点长"  rightType:SingleLineItemRightTypeCheck];
            [_dataArray addObject:item3];
        }
        
        {
            SingleLineLayoutItem *item4 = [SingleLineLayoutItem itemWithTitle:@"我的收藏(99)" subtitle:@"详细信息" icon:@"" rightType:SingleLineItemRightTypeArrowAndCustomView];
            UILabel *rightLabel = [[UILabel alloc] init];
            rightLabel.font = [UIFont systemFontOfSize:13];
            rightLabel.text = @"右侧自定义的视图";
            rightLabel.textColor = [UIColor orangeColor];
            [rightLabel sizeToFit];
            item4.rightView = rightLabel;
            [_dataArray addObject:item4];
        }
        
        {
            SingleLineLayoutItem *item5 = [SingleLineLayoutItem itemWithTitle:@"我的消息(5)" subtitle:@"详细信息" rightType:SingleLineItemRightTypeCustomView];
            item5.titleAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
            item5.subTitleAttributes = @{NSForegroundColorAttributeName : [UIColor cyanColor]};
            item5.rightView = [[UISwitch alloc] init];
            [_dataArray addObject:item5];
        }
    }
    return _dataArray;
}

@end
