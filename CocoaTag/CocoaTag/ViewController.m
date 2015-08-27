//
//  ViewController.m
//  CocoaTag
//
//  Created by Cocoa Lee on 15/8/27.
//  Copyright (c) 2015年 Cocoa Lee. All rights reserved.
//

#import "ViewController.h"
#import "CocoaTagView.h"
@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)NSMutableArray *tagsArray;
@property (nonatomic,strong)UITextField *textFiled;
@property (nonatomic,strong)CocoaTagView *tagsView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    NSArray *array = @[@"123",@"德玛西亚",@"洁白月光",@"秦时明月",@"花草",@"大圣归来",@"你在干嘛呢",@"碉堡了",@"然并卵",@"纯则脆，阳则钢"];
    _tagsArray = [NSMutableArray arrayWithArray:array];
    
    
    CocoaTagView *tagsView = [[CocoaTagView alloc] initWithFrame:CGRectMake(0, 20,CGRectGetWidth(self.view.bounds), 200)];
    [self.view addSubview:tagsView];
    [tagsView setTagsWithTagsArray:array];
    _tagsView = tagsView;
    
    
    
    
    UITextField *textFiled = [[UITextField alloc] initWithFrame:CGRectMake(30, CGRectGetHeight(self.view.bounds) - 360, CGRectGetWidth(self.view.bounds) - 60, 60)];
    textFiled.backgroundColor = [UIColor colorWithRed:255/255.0 green:247/255.0 blue:217/255.0 alpha:1];
    [textFiled becomeFirstResponder];
    textFiled.delegate =self;
    textFiled.placeholder = @"标签用 “，”隔开";
    [self.view addSubview:textFiled];
    _textFiled = textFiled;
    
    UIButton *button = [UIButton new];
    button.center = CGPointMake(textFiled.center.x, textFiled.center.y  + 60);
    button.bounds = CGRectMake(0, 0, 90, 30);
    [button setTitle:@"添加" forState:normal];
    button.backgroundColor = [UIColor colorWithRed:22/255.0 green:175/255.0 blue:202/255.0 alpha:1];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(addTags:) forControlEvents:UIControlEventTouchUpInside];
    
    
}


-(void)addTags:(UIButton *)button{
    if (_textFiled.text.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"请输入内容" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    
    NSMutableArray * array = [NSMutableArray array];
    if ([_textFiled.text rangeOfString:@","].length > 0 ) {
        array = [NSMutableArray arrayWithArray:[_textFiled.text componentsSeparatedByString:@","]];
    }
    else{
        array = [NSMutableArray arrayWithArray:@[_textFiled.text]];
    }
    
    if ([_textFiled.text rangeOfString:@"，"].length > 0 ) {
        array = [NSMutableArray arrayWithArray:[_textFiled.text componentsSeparatedByString:@"，"]];
    }
    else{
        array = [NSMutableArray arrayWithArray:@[_textFiled.text]];

    }
    
    [_tagsView updateTags:array];
    
    _textFiled.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES ];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
