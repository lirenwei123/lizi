//
//  root.m
//  考核效果
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "root.h"
#import "vc.h"

@interface root ()<UIScrollViewDelegate>
{
    UIButton *prebtn;
    UIView *redLine;
   
}
@property (strong,nonatomic) UIScrollView *sc ;
@end

@implementation root

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    self.navigationItem.title =@"首页";

    //按钮和红线
    for (int i=0; i<3; i++) {
        UIButton *btn =[UIButton buttonWithType:(UIButtonTypeSystem)];
        btn.frame =CGRectMake(self.view.bounds.size.width/3*i, 44, self.view.bounds.size.width/3, 50);
        btn.tag =i;
        switch (i) {
            case 0:
                [btn setTitle:@"视图一" forState:(UIControlStateNormal)];
                
                break;
            case 1:
                [btn setTitle:@"视图二" forState:(UIControlStateNormal)];
                prebtn =btn;

                break;
            case 2:
                [btn setTitle:@"视图三" forState:(UIControlStateNormal)];
                                break;
            default:
                break;
        }
        [self .view addSubview:btn];
        
        [btn addTarget:self action:@selector(move:) forControlEvents:(UIControlEventTouchUpInside)];
    }
    //redline
    
        redLine =[[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width/3, 94, self.view.bounds.size.width/3, 2)];
    redLine.backgroundColor =[UIColor redColor];
        [self.view addSubview:redLine];
    
   self.sc =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 96, self.view.bounds.size.width, self.view.bounds.size.height-96)];
    
    
    for (int i =0; i<3; i++) {
        vc *v =[[vc alloc]init];
        v.tab.tag =i;
        switch (i) {
            case 0:
                v.lableName =@"表格一" ;
                
                break;
            case 1:
                v.lableName =@"表格二" ;
                break;
            case 2:
                v.lableName =@"表格三" ;
                break;

            default:
                break;
        }
        v.view.frame =CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height-96);
        [self.sc addSubview:v.view];
        [self addChildViewController:v];
        
        self.sc.bounces =NO;
        self.sc.showsHorizontalScrollIndicator =YES;
        self.sc.pagingEnabled =YES;
        self.sc.delegate =self;

        
            }
    self.sc.contentOffset =CGPointMake(self.view.bounds.size.width, 0);
    self.sc.contentSize =CGSizeMake(self.sc.bounds.size.width*3, self.sc.bounds.size.height);
    [self.view addSubview:self.sc];
    
    
    
    
    
}

-(void)move:(UIButton *)sender{
    if (prebtn !=sender) {
        [sender setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [prebtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        prebtn =sender;
        //
    [UIView animateWithDuration:0.2 animations:^{
        redLine.frame =CGRectMake(self.view.bounds.size.width/3*sender.tag, 94, self.view.bounds.size.width/3, 2);
        //
        [self.sc setContentOffset:CGPointMake(self.sc.bounds.size.width*sender.tag, 0) animated:YES];
    }];
    }
  
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger x1 =scrollView.contentOffset.x/scrollView.bounds.size.width;
    NSLog(@"%lu",x1);
    //
    
    //
    UIButton *btn =[self.view viewWithTag:x1];
    if (prebtn !=btn) {
        //
        [btn setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
        [prebtn setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        prebtn =btn;
        //
        [UIView animateWithDuration:0.5 animations:^{
            redLine.frame =CGRectMake(self.view.bounds.size.width/3*x1, 94, self.view.bounds.size.width/3, 2);
        }];
    }

}

-(BOOL)prefersStatusBarHidden{
    return  YES;
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
