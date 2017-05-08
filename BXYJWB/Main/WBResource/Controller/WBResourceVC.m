//
//  WBResourceVC.m
//  BXYJWB
//
//  Created by MS on 17/2/8.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#import "WBResourceVC.h"
#import "WBIntroduceFile.h"
#import "WbTitleView.h"
#import "WBResourceCell.h"

@interface WBResourceVC ()
/**人数*/
@property(nonatomic,strong)WbTitleView* titleView;
/**搜索框*/
@property(nonatomic,strong)UISearchBar* searchBar;
/**是否分配*/
@property(nonatomic,strong)UILabel* allocationLabel;

@end

@implementation WBResourceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame = CGRectMake(0, 45, SCREENWIDTH, SCREENHEIGHT - 45 - 44 - 49);
    self.tableView.backgroundColor = [UIColor redColor];
    [self titleView];
    [self allocationLabel];
    [self searchBar];
    [self loadData];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.searchBar resignFirstResponder];
}

#pragma mark - 加载数据
-(void)loadData{
    [self showLoadingAnimation];
    NSDictionary* params = nil;
    [[WBNetReqeuest shareInstance] WB_ReqeustResourceWithParams:params sucess:^(id responseObject) {
        [self stopLoadingAnimation];
        [self.dataArray addObjectsFromArray:responseObject];
        [self.tableView reloadData];
    }];
}

#pragma mark - UItableViewDelegate
-(NSInteger)wb_numberOfSections{
    return 1;
}

-(NSInteger)wb_numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(WBTableViewCell *)wb_cellAtIndexPath:(NSIndexPath *)indexPath{
    WBResourceCell* cell = [WBResourceCell cellWithTableView:self.tableView];
    cell.model = [WBResourceModel resourceModel:self.dataArray[indexPath.row]];
    return cell;
}

-(CGFloat)wb_cellHeightAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

#pragma mark - 懒加载
-(WbTitleView *)titleView{
    if (!_titleView) {
        _titleView = [[WbTitleView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 35)];
        _titleView.consumerCount.text = @"10000人";
        [self.view addSubview:_titleView];
    }
    return _titleView;
}

-(UILabel *)allocationLabel{
    if (!_allocationLabel) {
        _allocationLabel = [LRPackage createLabelWithFrame:CGRectZero andWithText:@"是否分配" andWithTextColor:BLACK andWithLabelTextSize:15];
        [self.view addSubview:_allocationLabel];
        [_allocationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/4, 40));
            make.leading.equalTo(self.view.mas_leading).with.offset(10);
            make.top.equalTo(self.titleView.mas_bottom).with.offset(3);
        }];
    }
    return _allocationLabel;
}

-(UISearchBar *)searchBar{
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
        _searchBar.searchBarStyle = UISearchBarStyleMinimal;
        _searchBar.placeholder = @"请输入搜索的微博名";
        [self.view addSubview:_searchBar];
        [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREENWIDTH/3*2, 50));
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.view.mas_top).with.offset(45);
        }];
    }
    return _searchBar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
