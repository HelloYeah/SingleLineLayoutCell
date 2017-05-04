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
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[SingleLineLayoutCell class] forCellReuseIdentifier:@"SingleLineLayoutCell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    SingleLineLayoutCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SingleLineLayoutCell"];
    SingleLineLayoutItem *item = self.dataArray[indexPath.row ];
    [cell refreshTableViewCellWithEasyItem:item];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return rand() % 50 + 50;
}

- (NSArray *)dataArray {
    
    if (!_dataArray) {
        
        SingleLineLayoutItem *item0 = [SingleLineLayoutItem itemWithTitle:@"标题0" subtitle:@"subtitle" icon:@"3" rightType:SingleLineItemRightTypeArrow];
        item0.iconWidth = 30;
        item0.titleAttributes = @{NSForegroundColorAttributeName : [UIColor orangeColor]};
        item0.subTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:14],NSForegroundColorAttributeName : [UIColor lightGrayColor]};
        
        SingleLineLayoutItem *item1 = [SingleLineLayoutItem itemWithTitle:@"标题1" icon:@"" rightType:SingleLineItemRightTypeArrow];
      
        
        SingleLineLayoutItem *item2 = [SingleLineLayoutItem itemWithTitle:@"标题2" subtitle:@"the subtitle length is so long . oh my god" icon:@"4" rightType:SingleLineItemRightTypeCustomView];
        item2.iconWidth = 50;
        item2.titleAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
        item2.subTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor cyanColor]};
        UIImageView *icon = [[UIImageView alloc] init];
        icon.image = [UIImage imageNamed:@"4"];
        icon.size = CGSizeMake(40, 40);
        item2.rightView = icon;
        
        SingleLineLayoutItem *item3 = [SingleLineLayoutItem itemWithTitle:@"很长很长的标题真的很长"  rightType:SingleLineItemRightTypeCheck];
        
        SingleLineLayoutItem *item4 = [SingleLineLayoutItem itemWithTitle:@"标题4" subtitle:@"subtitle 4 4" icon:@"" rightType:SingleLineItemRightTypeArrowAndCustomView];
        UIImageView *icon1 = [[UIImageView alloc] init];
        icon1.image = [UIImage imageNamed:@"5"];
        icon1.size = CGSizeMake(40, 40);
        item4.rightView = icon1;
        item4.titleAttributes = @{NSForegroundColorAttributeName : [UIColor blueColor]};
        item4.subTitleAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:12],NSForegroundColorAttributeName : [UIColor greenColor]};
        
        _dataArray = @[item0,item1,item2,item3,item4,item0,item1,item2,item3,item4,item0,item1,item2,item3,item4,item0,item1,item2,item3,item4,item0,item1,item2,item3,item4];
    }
    return _dataArray;
}

@end
