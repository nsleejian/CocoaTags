//
//  CocoaTagView.m
//  CocoaTag
//
//  Created by Cocoa Lee on 15/8/27.
//  Copyright (c) 2015年 Cocoa Lee. All rights reserved.
//



#define COLOR_ARRAY @[[UIColor colorWithRed:239/255.0 green:43/255.0 blue:41/255.0 alpha:1],\
                    [UIColor colorWithRed:225/255.0 green:0/255.0 blue:81/255.0 alpha:1],\
                    [UIColor colorWithRed:137/255.0 green:0/255.0 blue:161/255.0 alpha:1],\
                    [UIColor colorWithRed:83/255.0 green:33/255.0 blue:168/255.0 alpha:1],\
                    [UIColor colorWithRed:48/255.0 green:58/255.0 blue:165/255.0 alpha:1],\
                    [UIColor colorWithRed:30/255.0 green:127/255.0 blue:239/255.0 alpha:1],\
                    [UIColor colorWithRed:19/255.0 green:150/255.0 blue:240/255.0 alpha:1],\
                    [UIColor colorWithRed:22/255.0 green:175/255.0 blue:202/255.0 alpha:1],\
                    [UIColor colorWithRed:153/255.0 green:133/255.0 blue:7/255.0 alpha:1],\
                    [UIColor colorWithRed:122/255.0 green:187/255.0 blue:58/255.0 alpha:1],\
                    [UIColor colorWithRed:251/255.0 green:63/255.0 blue:27/255.0 alpha:1]\
                    ];


#import "CocoaTagView.h"
#import "CocoaTagLabel.h"
@implementation CocoaTagView


- (void)setTagsWithTagsArray:(NSArray *)tagsArray{
    float tags_W = 0;
    float tags_H = 0;
    for (NSString *tags in tagsArray) {
        CocoaTagLabel *label = [[CocoaTagLabel alloc] initWithFrame:CGRectMake(tags_W + 5, tags_H, 0, 0)];
        label.clipsToBounds = YES;
        label.textColor = [UIColor whiteColor];
        label.layer.cornerRadius = 6;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = tags;
        label.backgroundColor = [UIColor redColor];
        tags_W = tags_W + CGRectGetWidth(label.bounds)+5;
        if (tags_W > CGRectGetWidth(self.bounds)) {
            tags_H += CGRectGetHeight(label.bounds) + 5;
            tags_W = 0;
            label.frame = CGRectMake(tags_W + 5, tags_H, label.frame.size.width, label.frame.size.height);
            tags_W = tags_W + CGRectGetWidth(label.bounds)+5;
        }
        
        NSArray *colorArray = COLOR_ARRAY;
        label.backgroundColor = colorArray[arc4random()%11];
        

        [self addSubview:label];
       
    }
    _tags_W = tags_W;
    _tags_H = tags_H;
    
}



- (void)updateTags:(NSArray *)tagsArray{
    
    
    for (NSString *tags in tagsArray) {
        CocoaTagLabel *label = [[CocoaTagLabel alloc] initWithFrame:CGRectMake(_tags_W + 5, _tags_H, 0, 0)];
        label.clipsToBounds = YES;
        label.textColor = [UIColor whiteColor];
        label.layer.cornerRadius = 6;
        label.textAlignment = NSTextAlignmentCenter;
        label.text = tags;
        label.backgroundColor = [UIColor redColor];
        _tags_W = _tags_W + CGRectGetWidth(label.bounds)+5;
        if (_tags_W > CGRectGetWidth(self.bounds)) {
            _tags_H += CGRectGetHeight(label.bounds) + 5;
            _tags_W = 0;
            label.frame = CGRectMake(_tags_W + 5, _tags_H, label.frame.size.width, label.frame.size.height);
            _tags_W = _tags_W + CGRectGetWidth(label.bounds)+5;
        }
        
        NSArray *colorArray = COLOR_ARRAY;
        label.backgroundColor = colorArray[arc4random()%11];
        
        
        [self addSubview:label];
        
    }
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
