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
    
    self.navigationItem.title = @"单行布局Cell";
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
            item2.iconWidth = 35;
            item2.titleAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
            item2.subTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor cyanColor]};
            UIImageView *icon = [[UIImageView alloc] init];
            icon.image = [UIImage imageNamed:@"4"];
            icon.size = CGSizeMake(40, 40);
            item2.rightView = icon;
            [_dataArray addObject:item2];
        }
        
        {
            SingleLineLayoutItem *item3 = [SingleLineLayoutItem itemWithTitle:@"很长很长的很长很长的很长很长的标题"  rightType:SingleLineItemRightTypeCheck];
            [_dataArray addObject:item3];
        }
        
        {
            SingleLineLayoutItem *item4 = [SingleLineLayoutItem itemWithTitle:@"标题4" subtitle:@"subtitle" icon:@"" rightType:SingleLineItemRightTypeArrowAndCustomView];
            UILabel *rightLabel = [[UILabel alloc] init];
            rightLabel.font = [UIFont systemFontOfSize:13];
            rightLabel.text = @"右侧自定义的视图";
            rightLabel.textColor = [UIColor orangeColor];
            [rightLabel sizeToFit];
            item4.rightView = rightLabel;
            [_dataArray addObject:item4];
        }
        
        {
            SingleLineLayoutItem *item5 = [SingleLineLayoutItem itemWithTitle:@"标题5" subtitle:@"subtitle" rightType:SingleLineItemRightTypeCustomView];
            item5.rightView = [[UISwitch alloc] init];
            [_dataArray addObject:item5];
        }
    }
    return _dataArray;
}

@end
