//
//  CSTreeTableView.h
//  CSTreeTableView
//
//  Created by 曹世鑫 on 2018/3/19.
//

#import <UIKit/UIKit.h>

@class Node;

@protocol TreeTableCellDelegate <NSObject>

-(void)cellClick : (Node *)node;

@end

@interface CSTreeTableView : UITableView

@property (nonatomic , weak) id<TreeTableCellDelegate> treeTableCellDelegate;

-(instancetype)initWithFrame:(CGRect)frame withData : (NSArray *)data;

@end
