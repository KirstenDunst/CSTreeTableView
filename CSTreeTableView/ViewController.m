//
//  ViewController.m
//  CSTreeTableView
//
//  Created by 曹世鑫 on 2018/3/19.
//

#import "ViewController.h"
#import "Node.h"
#import "CSTreeTableView.h"
#import "CSPoint.h"

@interface ViewController ()<TreeTableCellDelegate>

@property (strong, nonatomic)NSMutableArray *Points;
@property (strong, nonatomic)NSMutableArray *allPoints;
@property (strong, nonatomic)NSArray *dataSourceArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"DataArray" ofType:@"plist"
                          ];
    _dataSourceArray = [[NSArray alloc]initWithContentsOfFile:filePath];
    
    [self initPoints];
}

- (void)initPoints{
    _Points = [NSMutableArray array];
    _allPoints = [NSMutableArray array];
    [_dataSourceArray enumerateObjectsUsingBlock:^(NSDictionary  *pointDic, NSUInteger idx, BOOL * _Nonnull stop) {
        CSPoint *point = [[CSPoint alloc]initWithPointDic:pointDic];
        point.point_depth = @"0";
        point.point_expand = YES;
        [_Points addObject:point];
    }];
    [self recursiveAllPoints:_Points];
    
    //创建节点
    NSMutableArray *nodes = [NSMutableArray array];
    [_allPoints enumerateObjectsUsingBlock:^(CSPoint *point, NSUInteger idx, BOOL * _Nonnull stop) {
        Node *node = [[Node alloc]initWithParentId:[point.point_pid intValue] nodeId:[point.point_knowid intValue] name:point.point_name depth:[point.point_depth intValue] expand:point.point_expand];
        [nodes addObject:node];
    }];
    CSTreeTableView *tableView = [[CSTreeTableView alloc]initWithFrame:CGRectMake(0, [[UIApplication sharedApplication]statusBarFrame].size.height, self.view.frame.size.width, self.view.frame.size.height-[[UIApplication sharedApplication]statusBarFrame].size.height) withData:nodes];
    tableView.treeTableCellDelegate = self;
    [self.view addSubview:tableView];
}

- (void)recursiveAllPoints:(NSMutableArray *)point_arrM{
    __block int i = 0;
    __block NSString *parentId = nil;
    [point_arrM enumerateObjectsUsingBlock:^(CSPoint *point, NSUInteger idx, BOOL * _Nonnull stop) {
        [_allPoints addObject:point];
        i = [point.point_depth intValue];
        parentId = point.point_knowid;
        if ([point.point_son isEqualToString:@"1"]) {
            i = i+1;
            NSMutableArray *sonPoint = [NSMutableArray array];
            [point.point_son1 enumerateObjectsUsingBlock:^(NSDictionary *pointDic, NSUInteger idx, BOOL * _Nonnull stop) {
                CSPoint *point = [[CSPoint alloc]initWithPointDic:pointDic];
                point.point_depth = [NSString stringWithFormat:@"%d",i];
                point.point_pid = parentId;
                point.point_expand = NO;
                [sonPoint addObject:point];
            }];
            [self recursiveAllPoints:sonPoint];
        }else{
            i = 0;
        }
    }];
}

- (void)cellClick:(Node *)node{
    NSLog(@"?????????????///////////%@",node);
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
