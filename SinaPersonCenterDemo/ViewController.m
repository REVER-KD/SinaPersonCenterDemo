//
//  ViewController.m
//  SinaPersonCenterDemo
//
//  Created by REVER on 2018/7/16.
//  Copyright © 2018年 LJ. All rights reserved.
//

#import "ViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define Nav_Height 88

#define Normal_Height -140
#define ChangeView_Height 100
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    UIView *_topV, *_btnV;
    UIButton *_b1, *_b2 ,*_b3;
    UITableView *_tab;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, Nav_Height, SCREEN_WIDTH, SCREEN_HEIGHT-Nav_Height) style:UITableViewStyleGrouped];
//    _tab.backgroundColor = [UIColor orangeColor];
    _tab.dataSource  = self;
    _tab.delegate = self;
    _tab.sectionFooterHeight = 0.01;
    _tab.sectionHeaderHeight = 40;
    _tab.contentInset = UIEdgeInsetsMake(140, 0, 0, 0);
    [self.view addSubview:_tab];
    
    
    _topV = [[UIView alloc]initWithFrame:CGRectMake(0, Nav_Height, SCREEN_WIDTH, ChangeView_Height)];
    _topV.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_topV];
    
    _btnV = [[UIView alloc]initWithFrame:CGRectMake(0, Nav_Height+ChangeView_Height, SCREEN_WIDTH, 40)];
    _btnV.backgroundColor = [UIColor blueColor];
    [self.view addSubview:_btnV];
    
    _b1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _b1.frame = CGRectMake(0, 0, SCREEN_WIDTH/3, 40);
    _b1.backgroundColor = [UIColor yellowColor];
    [_b1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    _b1.tag = 0;
    [_btnV addSubview:_b1];
    
    _b2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _b2.frame = CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 40);
    _b2.backgroundColor = [UIColor lightGrayColor];
    [_b2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    _b2.tag = 1;
    [_btnV addSubview:_b2];
    
    _b3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _b3.frame = CGRectMake(2*SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3, 40);
    _b3.backgroundColor = [UIColor blackColor];
    [_b3 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    _b3.tag = 2;
    [_btnV addSubview:_b3];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnAction:(UIButton *)btn{
    [_tab scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:btn.tag] atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scroOffset = scrollView.contentOffset.y - Normal_Height;
    CGFloat viewHeight = ChangeView_Height - scroOffset;
    if (viewHeight < 0) {
        viewHeight = 0;
    }
    _topV.frame = CGRectMake(0, Nav_Height, SCREEN_WIDTH, viewHeight);
    _btnV.frame = CGRectMake(0, viewHeight+Nav_Height, SCREEN_WIDTH, 40);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    v.backgroundColor = [UIColor grayColor];
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.backgroundColor = [UIColor magentaColor];
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
