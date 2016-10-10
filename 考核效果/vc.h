//
//  vc.h
//  考核效果
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"

@interface vc : UIViewController
@property (copy,nonatomic)NSString *lableName;
@property (strong,nonatomic)UITableView *tab;
@end
