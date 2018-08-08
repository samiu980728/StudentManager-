//
//  LogInViewController.h
//  学生成绩管理系统
//
//  Created by 萨缪 on 2018/8/7.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StudentMsg.h"
#import "MyClass.h"
@interface LogInViewController : UIViewController

@property (nonatomic, assign) NSInteger InCount;

//添加学生信息的5个数组

//@property (nonatomic, strong) NSArray * naArray1;
//
//@property (nonatomic, strong) NSArray * crArray1;
//
//@property (nonatomic, strong) NSArray * pArray1;
//
//@property (nonatomic, strong) NSArray * nuArray1;
//
//@property (nonatomic, strong) NSArray * maArray1;
//
//@property (nonatomic, strong) NSArray * locaArray1;


@property (nonatomic, strong) NSMutableArray * naArray1;

@property (nonatomic, strong) NSMutableArray * crArray1;

@property (nonatomic, strong) NSMutableArray * pArray1;

@property (nonatomic, strong) NSMutableArray * nuArray1;

@property (nonatomic, strong) NSMutableArray * maArray1;

@property (nonatomic, strong) NSMutableArray * locaArray1;

//删除需要
@property (nonatomic, assign) NSInteger  weizhiInt;

@end
