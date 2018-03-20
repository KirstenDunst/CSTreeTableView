//
//  CSPoint.h
//  CSTreeTableView
//
//  Created by 曹世鑫 on 2018/3/19.
//

#import <Foundation/Foundation.h>

@interface CSPoint : NSObject

@property (copy,nonatomic)NSString *point_depth;  //知识点深度
@property (assign,nonatomic)BOOL point_expand;   //知识点展开与否

@property (copy,nonatomic)NSString *point_id;
@property (copy, nonatomic)NSString *point_knowid;
@property (copy, nonatomic)NSString *point_name;
@property (copy, nonatomic)NSString *point_pid;
@property (copy, nonatomic)NSString *point_pidA;
@property (copy, nonatomic)NSString *point_qNum;
@property (copy, nonatomic)NSString *point_url;
@property (copy, nonatomic)NSString *point_son;   //作为判断是否有子节点的条件。（0，1表示）
@property (copy, nonatomic)NSArray *point_son1;//子知识点

- (instancetype)initWithPointDic:(NSDictionary *)pointDic;
@end
