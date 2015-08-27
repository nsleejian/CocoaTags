//
//  CocoaTagView.h
//  CocoaTag
//
//  Created by Cocoa Lee on 15/8/27.
//  Copyright (c) 2015年 Cocoa Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CocoaTagView : UIView

@property(nonatomic,assign) float tags_W;
@property(nonatomic,assign) float tags_H;


- (void)setTagsWithTagsArray:(NSArray *)tagsArray;
//增加tag
- (void)updateTags:(NSArray *)tagsArray;


@end
