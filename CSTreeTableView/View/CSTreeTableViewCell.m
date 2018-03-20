//
//  CSTreeTableViewCell.m
//  CSTreeTableView
//
//  Created by 曹世鑫 on 2018/3/19.
//

#import "CSTreeTableViewCell.h"

@interface CSTreeTableViewCell()
{
    UIImageView *_headShow;
    UILabel *_labelTitle;
    UILabel *_labelContent;
    UILabel *_labelContentOther;
    UIButton *_senderBtn;
}
@end

@implementation CSTreeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView{
    _headShow = [[UIImageView alloc]init];
    _headShow.image = [UIImage imageNamed:@"1"];
    [self addSubview:_headShow];
    
    _labelTitle = [[UILabel alloc] init];
    _labelTitle.textColor = [UIColor redColor];
    _labelTitle.font = [UIFont systemFontOfSize:17];
    [self addSubview:_labelTitle];
    
    _labelContent = [[UILabel alloc] init];
    _labelContent.textColor = [UIColor orangeColor];
    _labelContent.font = [UIFont systemFontOfSize:15];
    [self addSubview:_labelContent];
    
    _labelContentOther = [[UILabel alloc] init];
    _labelContentOther.textColor = [UIColor yellowColor];
    _labelContentOther.font = [UIFont systemFontOfSize:12];
    [self addSubview:_labelContentOther];
    
    _senderBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_senderBtn setTintColor:[UIColor blueColor]];
    [_senderBtn addTarget:self action:@selector(buttonChoose:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_senderBtn];
}

- (void)buttonChoose:(UIButton *)sender{
    
}


- (void)setNode:(Node *)node{
    if (_node!=node) {
        _node = node;
    }
    NSLog(@">>>>>%d",node.depth);
    //等级的深度定义的cell显示样式
    switch (node.depth) {
        case 0:
        {
            _headShow.frame = CGRectMake(10, 5, 30, 30);
            _labelTitle.frame = CGRectMake(CGRectGetMaxX(_headShow.frame)+10, 5, 100, 30);
            _labelTitle.text = node.name;
        }
            break;
        case 1:
        {
            _headShow.frame = CGRectMake(10, 5, 30, 30);
            _labelTitle.frame = CGRectMake(CGRectGetMaxX(_headShow.frame)+10, 5, 100, 30);
            _labelTitle.text = node.name;
        }
            break;
        case 2:
        {
            _headShow.hidden = YES;
            _labelTitle.frame = CGRectMake(CGRectGetMaxX(_headShow.frame)+10, 5, 100, 30);
            _labelTitle.text = @"测试一个长数据加一个地址";
            _labelContent.frame = CGRectMake(self.contentView.frame.size.width-100, 5, 90, 30);
            _labelContent.text = @"这是一个时间显示的样子";
        }
            break;
        default:
            break;
    }
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
