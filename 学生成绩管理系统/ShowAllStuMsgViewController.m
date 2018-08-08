//
//  ShowAllStuMsgViewController.m
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "ShowAllStuMsgViewController.h"
#import "StudentMsg.h"
#import "MyClass.h"
#import "ShowTableViewCell.h"
#import "addStuMsgViewController.h"


@interface ShowAllStuMsgViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
//addStuMsgViewControllerDelegate

//在这里 把weizhiInt 的值再赋值给一个变量

@end

@implementation ShowAllStuMsgViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _numInt = 0;

    MyClass * iosClass = [[MyClass alloc] initWithClassName:@"iOS班级"];
    
//    //删除集体位置的 代码放在这里
//    _locaUint = [_numArray1 indexOfObject:[NSNumber numberWithInteger:_zhiweiInt]];
    
    //这里还没有改好 每次只能添加一个学生
    _nameArray1 = [[NSMutableArray alloc]init];
    _numArray1 = [[NSMutableArray alloc]init];
    _mathArray1 = [[NSMutableArray alloc]init];
    _peArray1 = [[NSMutableArray alloc]init];
    _creditArray1 = [[NSMutableArray alloc]init];

    
    if ( [[iosClass stuList] count] == 0 ){
    for (int i = 0; i < 10; i++) {
    
        StudentMsg * stu = [[StudentMsg alloc] initWithName:[NSString stringWithFormat:@"jpx%02d",i+1] andNum:i andMathScore:i+40 andPEScore:i+60 andCredit:i+80];
        [iosClass addStudent:stu];
        //[stu printStudent];
        
        
        
        [_nameArray1 addObject:[stu nameStr]];
        [_numArray1 addObject:[NSNumber numberWithInteger:[stu numInt]]];
        [_mathArray1 addObject:[NSNumber numberWithInteger:[stu scoreMathInt]]];
        [_peArray1 addObject:[NSNumber numberWithInteger:[stu scorePEInt]]];
        [_creditArray1 addObject:[NSNumber numberWithInteger:[stu creditInt]]];

    }
        
    }
    
    //以下为删除
    //现在位置信息已经得到
    if ( [_numArray1 isKindOfClass:[NSArray class]] && _numArray1.count > 0 ){
    _locaUint = [_numArray1 indexOfObject:[NSNumber numberWithInteger:_zhiweiInt]];


   // 删除数组中的信息
    if ( _locaUint != 0 ){
    [_nameArray1 removeObjectAtIndex:_locaUint];
    [_numArray1 removeObjectAtIndex:_locaUint];
    [_mathArray1 removeObjectAtIndex:_locaUint];
    [_peArray1 removeObjectAtIndex:_locaUint];
    [_creditArray1 removeObjectAtIndex:_locaUint];
    }
    }
   // 以上为删除
    
    //NSLog(@"从前的  _numArray1 = %@",_nameArray1);
    //以下为添加
    NSLog(@"_mathInt = %li",_mathInt);
    
    //如果改成数组 这里也要变了   
    if ( [_XMathArray count] != 0  ){
        
        
        //这里到时候去掉！！！！
        
        
//    [_nameArray1 addObject:_nameStr];
//    [_mathArray1 addObject:[NSNumber numberWithInteger:_mathInt]];
//    [_peArray1 addObject:[NSNumber numberWithInteger:_peInt]];
//    [_creditArray1 addObject:[NSNumber numberWithInteger:_credInt]];
//    [_numArray1 addObject:[NSNumber numberWithInteger:_nuInt]];
//
        //试试用数组给数组的方式 看来这种是可以的 但是格式不对
        //终于好了 这个格式就对了！！！
        [_mathArray1 addObjectsFromArray:_XMathArray];
        [_numArray1 addObjectsFromArray:_XNumArray];
        [_nameArray1 addObjectsFromArray:_XNameArray];
        [_peArray1 addObjectsFromArray:_XPEArray];
        [_creditArray1 addObjectsFromArray:_XCredArray];
        
        
            //可变数组中添加不可变数组 格式问题
            [_nameArray1 addObjectsFromArray:_XNameArray];
//        }
        //[_nameArray1 addObjectsFromArray:_nameArray1];
        
//        NSLog(@"_peArray1 count = %li",[_XPEArray count]);
//        NSLog(@"_XCredArray count = %li",[_XCredArray count]);
//        NSLog(@"_XNumArray count = %li",[_XNumArray count]);
//        NSLog(@"_XMathArray count = %li",[_XMathArray count]);
        //NSLog(@"用_XNameArray添加的_nameArray1 = %@",_nameArray1);
        
    }
    //以上为添加
    
    //最终算位置
    _numInt = [_peArray1 count];
    
    NSLog(@"重新获取后的numInt = %li",_numInt);
    //NSLog(@"之后的  _numArray1 = %@",_nameArray1);
    
    
    //注册申请
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    
    [_tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"labelCell"];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    
    [self.view addSubview:_tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell1 = nil;
    ShowTableViewCell * cell2 = nil;
    if ( indexPath.row == 0 ){
        cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if ( cell1 == nil ){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
            UIButton * button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button1.frame = CGRectMake(0, 0, 200, 30);
            [button1 setTitle:@"显示完毕,返回主界面" forState:UIControlStateNormal];
            [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button1 addTarget:self action:@selector(pressButton1:) forControlEvents:UIControlEventTouchUpInside];
            [cell1.contentView addSubview:button1];
        }
        return cell1;
    }
    else{
        cell2 = [_tableView dequeueReusableCellWithIdentifier:@"labelCell" forIndexPath:indexPath];
        //cell2.label.text = @"你哈奥";
        cell2.label.text = [NSString stringWithFormat:@"姓名:%@",[_nameArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label1.text = [NSString stringWithFormat:@"学号:%@",[_numArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label2.text = [NSString stringWithFormat:@"数学:%@分",[_mathArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label3.text = [NSString stringWithFormat:@"体育:%@分",[_peArray1 objectAtIndex:indexPath.row-1]];
        
        cell2.label4.text = [NSString stringWithFormat:@"学分:%@分",[_creditArray1 objectAtIndex:indexPath.row-1]];
        
//        cell2.label.text = [_nameArray1 objectAtIndex:indexPath.row-1];
//        cell2.label1.text = [_numArray1 objectAtIndex:indexPath.row-1];
//        cell2.label2.text = [_mathArray1 objectAtIndex:indexPath.row-1];
//        cell2.label3.text = [_peArray1 objectAtIndex:indexPath.row-1];
//        cell2.label4.text = [_creditArray1 objectAtIndex:indexPath.row-1];
        return cell2;
        
    }
    
    //return cell2;
}

//自定义单元格 第一栏一个button 点击返回主界面

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"实际 = %li",_numInt+1);
    return _numInt+1;
    //return 20;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (void)pressButton1:(UIButton *)btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    NSLog(@"ShowAllStuMsgViewController %s",__func__);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
