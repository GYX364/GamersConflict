//
//  GCNewsSubView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSubView.h"
#import "GCNewsModel.h"
#import "GCNewsSubModel.h"
#import "GCNewsSubViewCell.h"

#define kNewsSubModel @"GCNewsSubModel"
#define kNewsSubViewCell @"GCNewsSubViewCell"

static NSString * const reUesId = @"subViewCell";

@interface GCNewsSubView()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *articlesList;

@end

@implementation GCNewsSubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.dataSource = self;
//        self.delegate = self;
//        [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//    }
//    return self;
//}

- (void)awakeFromNib {
    self.dataSource = self;
    self.delegate = self;
    self.rowHeight = 300;
    self.showsVerticalScrollIndicator = NO;
//    [self registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self registerNib:[UINib nibWithNibName:kNewsSubViewCell bundle:nil] forCellReuseIdentifier:reUesId];
}

- (NSMutableArray *)articlesList {
    if (_articlesList == nil) {
        _articlesList = [NSMutableArray array];
    }
    return _articlesList;
}

- (void)setDataWithModel:(GCNewsModel *)model {
    if (model.newsDictioary.allKeys.count != 0) {
//        NSLog(@"%@", model.newsDictioary[@"data"][@"list"]);
        NSArray *list = model.newsDictioary[@"data"][@"list"];
        if (list.count != 0) {
            for (NSDictionary *dic in list) {
                GCNewsSubModel *model = [[GCNewsSubModel alloc] init];
                [model setValuesForKeysWithDictionary:dic];
                NSLog(@"%@", model.litpic);
                [self.articlesList addObject:model];
            }
//            NSLog(@"%@", self.articlesList);
        }
        [self reloadData];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    NSLog(@"%ld", self.articlesList.count);
    return self.articlesList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
//    }
    
    GCNewsSubViewCell *cell = [self dequeueReusableCellWithIdentifier:reUesId forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:kNewsSubViewCell owner:nil options:nil] firstObject];
    }
    if (self.articlesList.count > 0) {
        GCNewsSubModel *model = self.articlesList[indexPath.row];
        [cell setCellWithModel:model];
    }
    return cell;
}

@end
