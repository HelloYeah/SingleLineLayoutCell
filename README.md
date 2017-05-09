# SingleLineLayoutCell


- 工欲善其事，必先利其器。面对各种各样的单行cell，虽然代码写起来不难，但是还是比较繁琐的，浪费时间。怎么样用一种cell直接搞定这些乱七八糟的样式，实现快速高效的实现。详情请看demo源码，以下是效果图以及使用方法。欢迎各位提出建议，指导，star。


### 效果图

![1.gif](http://upload-images.jianshu.io/upload_images/1338042-2cda6fa6ebb0ec57.gif?imageMogr2/auto-orient/strip)


### 示例用法

       //弹窗，标题，子标题，图标，右侧箭头
       {
            SingleLineLayoutItem *item0 = [SingleLineLayoutItem itemWithTitle:@"弹窗" subtitle:@"subtitle" icon:@"3" rightType:SingleLineItemRightTypeArrow];
            item0.iconWidth = 30;
            item0.operation = ^{
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"It is so cool" message:@"Hello World !!! " delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
                [alertView show];
            };
        }
        
        //push，标题，右侧箭头
        {
            SingleLineLayoutItem *item1 = [SingleLineLayoutItem itemWithTitle:@"push到下一控制器" rightType:SingleLineItemRightTypeArrow];
            __weak typeof(self) weakSelf = self;
            item1.operation = ^{
                UIViewController *vc = [[UIViewController alloc] init];
                vc.view.backgroundColor = [UIColor cyanColor];
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
        }
        
        //标题，子标题，图标，右侧自定义视图为UIImageView
        {
            SingleLineLayoutItem *item2 = [SingleLineLayoutItem itemWithTitle:@"标题2" subtitle:@"the subtitle length is so long . oh my god" icon:@"4" rightType:SingleLineItemRightTypeCustomView];
            item2.iconWidth = 30;
            UIImageView *icon = [[UIImageView alloc] init];
            icon.image = [UIImage imageNamed:@"4"];
            icon.size = CGSizeMake(30, 30);
            item2.rightView = icon;
            [_dataArray addObject:item2];
        }
        
        //标题，右侧TypeCheck
        {
            SingleLineLayoutItem *item3 = [SingleLineLayoutItem itemWithTitle:@"这个标题有点长。真的有点长"  rightType:SingleLineItemRightTypeCheck];
            [_dataArray addObject:item3];
        }
        
        //标题，子标题，图标，右侧箭头，右侧自定义视图为UILabel
        {
            SingleLineLayoutItem *item4 = [SingleLineLayoutItem itemWithTitle:@"我的收藏(99)" subtitle:@"详细信息" icon:@"" rightType:SingleLineItemRightTypeArrowAndCustomView];
            UILabel *rightLabel = [[UILabel alloc] init];
            rightLabel.font = [UIFont systemFontOfSize:13];
            rightLabel.text = @"右侧自定义的视图";
            rightLabel.textColor = [UIColor orangeColor];
            [rightLabel sizeToFit];
            item4.rightView = rightLabel;
        }
        
         //带富文本的标题，子标题，右侧自定义视图为UISwitch
        {
            SingleLineLayoutItem *item5 = [SingleLineLayoutItem itemWithTitle:@"我的消息(5)" subtitle:@"详细信息" rightType:SingleLineItemRightTypeCustomView];
            item5.titleAttributes = @{NSForegroundColorAttributeName : [UIColor redColor]};
            item5.subTitleAttributes = @{NSForegroundColorAttributeName : [UIColor cyanColor]};
            item5.rightView = [[UISwitch alloc] init];
        }
        
        
  ---     
   
# TextInputCell

![2.gif](http://upload-images.jianshu.io/upload_images/1338042-76f2e0c1adcdc839.gif?imageMogr2/auto-orient/strip)

### 示例用法

        TextInputItem *receiverItem = [TextInputItem textInputItemWithPlaceholder:@"请输入收货人姓名" text:nil];
        
        TextInputItem *phoneItem = [TextInputItem textInputItemWithWithTitle:@"手机号: " Placeholder:@"请输入11位手机号" text:@"13000000000"];
        //设置弹出键盘的样式
        phoneItem.keyboardType = UIKeyboardTypeNumberPad;
        
        TextInputItem *detailAddressItem = [TextInputItem textInputItemWithTitle:@"详细地址: " Placeholder:@"请输入详细地址" textInputType:TextInputTextView];
