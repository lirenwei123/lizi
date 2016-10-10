//
//  vc.m
//  考核效果
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "vc.h"
#import "Cell.h"

@interface vc ()<UITableViewDelegate,UITableViewDataSource>
@end

@implementation vc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tab =[[UITableView alloc]initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
    //head
    UILabel *head =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 414, 50)];
    head.text =self.lableName;
    head.textAlignment =NSTextAlignmentCenter;
    head.backgroundColor =[UIColor greenColor];
    
    self.tab.tableHeaderView =head;
    self.tab.delegate =self;
    self.tab.dataSource =self;
    [self.view addSubview:self.tab];
   
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 500;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Cell *cell =[tableView dequeueReusableCellWithIdentifier:@"c"];
    if (cell ==nil) {
        cell =[[Cell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"c"];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text =[NSString stringWithFormat:@"This Is Cell%lu",indexPath.row+1];
    [cell.btn setTitle:[NSString stringWithFormat:@"button%lu",indexPath.row+1] forState:(UIControlStateNormal)];
    cell.btn.backgroundColor =[UIColor greenColor];
    if ([self.lableName isEqualToString:@"表格一"]) {
        cell.backgroundColor =[UIColor brownColor];
    }
    if ([self.lableName isEqualToString:@"表格二"]) {
        cell.backgroundColor =[UIColor grayColor];
    }
    if ([self.lableName isEqualToString:@"表格三"]) {
        cell.backgroundColor =[UIColor orangeColor];
    }
          return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
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
