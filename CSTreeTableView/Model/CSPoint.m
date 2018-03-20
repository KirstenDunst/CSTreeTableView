//
//  CSPoint.m
//  CSTreeTableView
//
//  Created by 曹世鑫 on 2018/3/19.
//

#import "CSPoint.h"

@implementation CSPoint

- (instancetype)initWithPointDic:(NSDictionary *)pointDic{
    self = [super init];
    if (self) {
        _point_id = [pointDic[@"id"] copy];
        _point_depth = [pointDic[@"depth"] copy];
        _point_knowid = [pointDic[@"nodeId"] copy];
        _point_name = [pointDic[@"name"] copy];
        _point_pid = [pointDic[@"parentId"] copy];
        _point_pidA = [pointDic[@"pidA"] copy];
        _point_url = [pointDic[@"url"] copy];
        _point_qNum = [pointDic[@"qNum"] copy];
        _point_son = [pointDic[@"son"] copy];
        _point_son1 = pointDic[@"son1"];
    }
    return self;
}

@end
