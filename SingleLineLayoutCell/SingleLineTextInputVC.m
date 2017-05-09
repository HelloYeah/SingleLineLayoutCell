//
//  SingleLineTextInputVC.m
//  SingleLineLayoutCell
//
//  Created by Sekorm on 2017/5/9.
//  Copyright © 2017年 YL. All rights reserved.
//

#import "SingleLineTextInputVC.h"
#import "TextInputCell.h"
#import "TextInputItem.h"

@interface SingleLineTextInputVC () <UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation SingleLineTextInputVC

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.tableView registerClass:[TextInputCell class] forCellReuseIdentifier:@"TextInputCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)viewDidAppear:(BOOL)animated {

    [super viewDidAppear:animated];
    NSArray *array = [self.tableView visibleCells];
    UITableViewCell *cell = array.firstObject;
    [cell becomeFirstResponder];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TextInputCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextInputCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    TextInputItem *item = self.dataArray[indexPath.row];
    cell.textInputItem = item;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 2) {
        return 100;
    }
    return 60;
}

- (NSMutableArray *)dataArray {
    
    if (!_dataArray) {
        
        _dataArray = [NSMutableArray array];
        
        TextInputItem *receiverItem = [TextInputItem textInputItemWithPlaceholder:@"请输入收货人姓名" text:nil];
        TextInputItem *phoneItem = [TextInputItem textInputItemWithWithTitle:@"手机号: " Placeholder:@"请输入11位手机号" text:@"13000000000"];
        phoneItem.keyboardType = UIKeyboardTypeNumberPad;
        TextInputItem *detailAddressItem = [TextInputItem textInputItemWithTitle:@"详细地址: " Placeholder:@"请输入详细地址" textInputType:TextInputTextView];
        [_dataArray addObjectsFromArray:@[receiverItem,phoneItem,detailAddressItem]];
    }
    return _dataArray;
}

@end
