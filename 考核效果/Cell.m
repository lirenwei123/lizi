//
//  Cell.m
//  考核效果
//
//  Created by apple on 16/8/1.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "Cell.h"

@implementation Cell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.btn =[UIButton buttonWithType:(UIButtonTypeSystem)];
        self.btn.frame =CGRectMake(self.frame.size.width*0.7, 10, 100, 40);
      
        [self.contentView addSubview:self.btn];
    }
    return self;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
