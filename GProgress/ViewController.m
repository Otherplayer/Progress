//
//  ViewController.m
//  GProgress
//
//  Created by __无邪_ on 15/2/2.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "GProgress.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [Progress showProgressWithText:@"__无邪_" dealy:1];
//    [Progress showText:@"ss" onView:self.view];
    
    [Progress showToastWithText:@"hahasdfa" position:iToastGravityCenter];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
