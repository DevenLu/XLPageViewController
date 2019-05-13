//
//  BasicFunctionListVC.m
//  XLPageViewControllerExample
//
//  Created by MengXianLiang on 2019/5/10.
//  Copyright © 2019 jwzt. All rights reserved.
//

#import "BasicFunctionListVC.h"
#import "BasicFounctionExampleVC.h"
#import "CustomTitleViewCellExampleVC.h"

@interface BasicFunctionListVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BasicFunctionListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self buildTable];
}

- (void)buildTable {
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

#pragma mark -
#pragma mark TableViewDelegate&DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self cellTitles].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self cellTitles][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //自定义标题cell
    if (indexPath.row == 16) {
        CustomTitleViewCellExampleVC *exampleVC = [[CustomTitleViewCellExampleVC alloc] init];
        exampleVC.title = [self cellTitles][indexPath.row];
        [self.navigationController pushViewController:exampleVC animated:true];
        return;
    }
    //其他
    BasicFounctionExampleVC *exampleVC = [[BasicFounctionExampleVC alloc] init];
    exampleVC.title = [self cellTitles][indexPath.row];
    exampleVC.config = [self configOfIndexPath:indexPath];
    exampleVC.titles = [self vcTitlesOfIndexPath:indexPath];
    [self.navigationController pushViewController:exampleVC animated:true];
}

- (NSArray *)cellTitles {
    return @[
             @"1.基本样式-标题正常显示（默认）",
             @"2.基本样式-标题显示在导航栏上",
             @"3.Segmented样式-标题正常显示",
             @"4.Segmented样式-标题显示在导航栏上",
             @"5.标题栏-局左",
             @"6.标题栏-局中",
             @"7.标题栏局右",
             @"8.标题-自定义宽度",
             @"9.标题-自定义高度",
             @"10.标题-文字局上",
             @"11.标题-文字居下",
             @"12.标题-关闭标题颜色过渡",
             @"13.阴影动画-缩放",
             @"14.阴影动画-无",
             @"15.阴影末端形状-圆角",
             @"16.阴影末端形状-方形",
             @"17.自定义cell",
             @"18.频道订阅"
             ];
}

- (XLPageViewControllerConfig *)configOfIndexPath:(NSIndexPath *)indexPath {
    XLPageViewControllerConfig *config = [XLPageViewControllerConfig defaultConfig];
    switch (indexPath.row) {
        case 0:
            break;
        case 1:
            //在导航栏中显示标题
            config.showTitleInNavigationBar = true;
            //隐藏底部分割线
            config.separatorLineHidden = true;
            break;
        case 2:
            //设置标题样式为分段
            config.titleViewStyle = XLPageTitleViewStyleSegmented;
            //分段选择器颜色
            config.segmentedTintColor = [UIColor blackColor];
            //标题缩进
            config.titleViewInset = UIEdgeInsetsMake(5, 50, 5, 50);
            break;
        case 3:
            //设置标题样式为分段
            config.titleViewStyle = XLPageTitleViewStyleSegmented;
            //分段选择器颜色
            config.segmentedTintColor = [UIColor blackColor];
            //标题缩进
            config.titleViewInset = UIEdgeInsetsMake(5, 50, 5, 50);
            //在navigationBar上显示标题
            config.showTitleInNavigationBar = true;
            //隐藏底部分割线
            config.separatorLineHidden = true;
            break;
        case 4:
            //标题左对齐
            config.titleViewAlignment = XLPageTitleViewAlignmentLeft;
            break;
        case 5:
            //标题居中显示
            config.titleViewAlignment = XLPageTitleViewAlignmentCenter;
            break;
        case 6:
            //标题右对齐
            config.titleViewAlignment = XLPageTitleViewAlignmentRight;
            break;
        case 7:
            //设置标题宽度为屏幕宽度1/3
            config.titleWidth = self.view.bounds.size.width/3.0f;
            //设置标题间隔为0
            config.titleSpace = 0;
            //设置标题缩进
            config.titleViewInset = UIEdgeInsetsZero;
            break;
        case 8:
            //设置标题高度
            config.titleViewHeight = 64;
            break;
        case 9:
            //标题文字上对齐
            config.textVerticalAlignment = XLPageTextVerticalAlignmentTop;
            break;
        case 10:
            //标题缩进
            config.titleViewInset = UIEdgeInsetsMake(0, 10, 5, 10);
            //标题文字下对齐
            config.textVerticalAlignment = XLPageTextVerticalAlignmentBottom;
            break;
        case 11:
            //标题颜色过渡
            config.titleColorTransition = false;
            break;
        case 12:
            //设置阴影动画为缩放
            config.shadowLineAnimationType = XLPageShadowLineAnimationTypeZoom;
            break;
        case 13:
            //设置阴影动画为无动画
            config.shadowLineAnimationType = XLPageShadowLineAnimationTypeNone;
            break;
        case 14:
            //设置阴影末端形状为圆角
            config.shadowLineCap = XLPageShadowLineCapRound;
            config.shadowLineHeight = 5;
            break;
        case 15:
            //设置阴影末端形状为方形
            config.shadowLineCap = XLPageShadowLineCapSquare;
            config.shadowLineHeight = 5;
            break;
        default:
            break;
    }
    return config;
}

- (NSArray *)vcTitlesOfIndexPath:(NSIndexPath *)indexPath {
    NSArray *titleArr = @[@"今天",@"是个",@"好日子",@"心想的",@"事儿",@"都能成",@"明天",@"是个",@"好日子",@"打开了家门",@"咱迎春风",@"~~~"];
    if (indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4 ||indexPath.row == 5 || indexPath.row == 6 || indexPath.row == 7) {
        titleArr = @[@"今天",@"是个",@"好日子"];
    }
    return titleArr;
}

@end
