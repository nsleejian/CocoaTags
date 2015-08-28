//
//  CocoaTagLabel.m
//  CocoaTag
//
//  Created by Cocoa Lee on 15/8/27.
//  Copyright (c) 2015年 Cocoa Lee. All rights reserved.
//
#define MAX_SIZE_HEIGHT 5000


#import "CocoaTagLabel.h"


@implementation CocoaTagLabel





- (void)setText:(NSString *)text{

    super.text = text;
//    CGSize size = [self.text sizeWithFont:self.font constrainedToSize:CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), MAX_SIZE_HEIGHT) lineBreakMode:NSLineBreakByCharWrapping];
//    
    
    CGSize size = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size;
    

    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width + 30, size.height + 20);
    

}


@end
