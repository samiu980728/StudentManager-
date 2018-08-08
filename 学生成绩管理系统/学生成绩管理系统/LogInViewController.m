//
//  LogInViewController.m
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "LogInViewController.h"
#import "StudentMsg.h"
#import "MyClass.h"
#import "ShowAllStuMsgViewController.h"
#import "addStuMsgViewController.h"
#import "DeleteMsgViewController.h"
//#import "DeleteMsgViewController.h"

@interface LogInViewController ()<addStuMsgViewControllerDelegate,deleteStuMsgViewControllerDelegate>
//{
//    addStuMsgViewController * addStuViewController;
//}

@end

@implementation LogInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化
//    _naArray1 = [[NSArray alloc]init];
//    _nuArray1 = [[NSArray alloc]init];
//    _maArray1 = [[NSArray alloc]init];
//    _pArray1 = [[NSArray alloc]init];
//    _crArray1 = [[NSArray alloc]init];
//    _locaArray1 = [[NSArray alloc] init];
    
    _naArray1 = [[NSMutableArray alloc]init];
    _nuArray1 = [[NSMutableArray alloc]init];
    _maArray1 = [[NSMutableArray alloc]init];
    _pArray1 = [[NSMutableArray alloc]init];
    _crArray1 = [[NSMutableArray alloc]init];
    _locaArray1 = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton * addStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton * deleteStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton * changStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton * findStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    UIButton * allStuMsgButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    
    addStuMsgButton.frame = CGRectMake(40, 140, 100, 30);
    [addStuMsgButton setTitle:@"增加学生信息" forState:UIControlStateNormal];
    [addStuMsgButton addTarget:self action:@selector(pressaddStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    deleteStuMsgButton.frame = CGRectMake(200, 140, 100, 30);
    [deleteStuMsgButton setTitle:@"删除学生信息" forState:UIControlStateNormal];
    [deleteStuMsgButton addTarget:self action:@selector(pressdeleteStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    changStuMsgButton.frame = CGRectMake(40, 190, 100, 30);
    [changStuMsgButton setTitle:@"修改学生信息" forState:UIControlStateNormal];
    [changStuMsgButton addTarget:self action:@selector(presschangStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    findStuMsgButton.frame = CGRectMake(200, 190, 100, 30);
    [findStuMsgButton setTitle:@"查找学生信息" forState:UIControlStateNormal];
    [findStuMsgButton addTarget:self action:@selector(pressfindStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    allStuMsgButton.frame = CGRectMake(70, 250, 200, 30);
    [allStuMsgButton setTitle:@"显示所有学生信息" forState:UIControlStateNormal];
    [allStuMsgButton addTarget:self action:@selector(pressallStuMsgButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:addStuMsgButton];
    [self.view addSubview:deleteStuMsgButton];
    [self.view addSubview:changStuMsgButton];
    [self.view addSubview:findStuMsgButton];
    [self.view addSubview:allStuMsgButton];
    
}

//没关系啊 在这里初始化 第一次的已经进去了 在那里

//删除按钮
 - (void)pressdeleteStuMsgButton:(UIButton *)btn
{
    DeleteMsgViewController * deleteViewController = [[DeleteMsgViewController alloc] init];

    deleteViewController.delegate = self;

    [self presentViewController:deleteViewController animated:YES completion:nil];
}

//删除信息协议
- (void)returnNumlocationTextField:(NSInteger)numLocation
{
    //创建一个NSIngeger类型的
    //不应该在这里  在这里应该创建一个全局变量 接收这个位置即可
    _weizhiInt = numLocation;
    
}

//添加学生信息协议
- (void)getLocationTextFiled:(NSInteger)location andName:(NSString *)name andNum:(NSInteger)num andMath:(NSInteger)math andPE:(NSInteger)PE andCredit:(NSInteger)credit
{
    
    //添加到学生类中
    NSLog(@"************yyy*********");
    
//    _naArray1 = [[NSMutableArray alloc]init];
//    _nuArray1 = [[NSMutableArray alloc]init];
//    _maArray1 = [[NSMutableArray alloc]init];
//    _pArray1 = [[NSMutableArray alloc]init];
//    _crArray1 = [[NSMutableArray alloc]init];
//    _locaArray1 = [[NSMutableArray alloc] init];
//
//    [_locaArray1 addObject:[NSNumber numberWithInteger:location]];
    
    [_naArray1 addObject:name];
    [_nuArray1 addObject:[NSNumber numberWithInteger:num]];
    [_maArray1 addObject:[NSNumber numberWithInteger:math]];
    [_pArray1 addObject:[NSNumber numberWithInteger:PE]];
    [_crArray1 addObject:[NSNumber numberWithInteger:credit]];
    //NSLog(@"math = %li",math);
    //NSLog(@"_maArray1 = %@",_maArray1);
    //NSLog(@"_naArray1 = %@",_naArray1);

}

- (void)pressallStuMsgButton:(UIButton *)btn
{
    ShowAllStuMsgViewController * showStuMsgView = [[ShowAllStuMsgViewController alloc] init];
    
    
    //这里也有问题！！！

    //删除
     showStuMsgView.zhiweiInt = _weizhiInt;

    if ( [_maArray1 isKindOfClass:[NSArray class]] && _maArray1.count > 0 ){
        
        showStuMsgView.XMathArray = [NSArray arrayWithArray:_maArray1];
        showStuMsgView.XNameArray = [NSArray arrayWithArray:_naArray1];
        showStuMsgView.XPEArray = [NSArray arrayWithArray:_pArray1];
        showStuMsgView.XNumArray = [NSArray arrayWithArray:_nuArray1];
        showStuMsgView.XCredArray = [NSArray arrayWithArray:_crArray1];
        
        NSLog(@"XmathArray count = %li",[showStuMsgView.XMathArray count]);
        //NSLog(@"_maArray cont = %li",[_maArray1 count]);
        NSLog(@"XMathArray = %@",showStuMsgView.XMathArray);
        
        NSLog(@"XNameArray = %@",showStuMsgView.XNameArray);
    
    }
    
    [self presentViewController:showStuMsgView animated:YES completion:nil];
}

//添加
- (void)pressaddStuMsgButton:(UIButton *)btn
{
    //NSLog(@"调用协议赋值吧");
        addStuMsgViewController * addViewController = [[addStuMsgViewController alloc] init];
        addViewController.delegate = self;
        //NSLog(@"_naArray1 = %@",_naArray1);
    [self presentViewController:addViewController animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
