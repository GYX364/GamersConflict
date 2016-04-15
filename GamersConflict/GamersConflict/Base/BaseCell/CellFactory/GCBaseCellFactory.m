//
//  GCBaseCellFactory.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseCellFactory.h"
#import "GCBaseTableViewCell.h"
#import "GCBaseModel.h"

@implementation GCBaseCellFactory

+ (BOOL)tableView:(UITableView *)tableview registeringType:(RegisterType)registeringType withModel:(GCBaseModel *)model {
    if (model == nil) {
        return NO;
    }
    // 根据modelbrand拼接对应Cell的类
    NSString *cellBrand = [NSStringFromClass([model class]) stringByAppendingString:@"Cell"];
    // 判断cell类是否存在 如果存在则注册 reuseIDentifier默认为cell类名
    if ([NSClassFromString(cellBrand) class]) {
        // 注册nib
        if (registeringType == RegisterTypeNib) {
            [tableview registerNib:[UINib nibWithNibName:cellBrand bundle:nil] forCellReuseIdentifier:cellBrand];
        } else if (registeringType == RegisterTypeClass) {
            [tableview registerClass:[NSClassFromString(cellBrand) class] forCellReuseIdentifier:cellBrand];
        } else {
            return NO;
        }
        return YES;
    }
    // 当程序运行到这里是 说明cell 并没有被注册
    return NO;
}

+ (GCBaseTableViewCell *)cellProducedWithModel:(GCBaseModel *)model forTableView:(UITableView *)tableView cellIndexPath:(NSIndexPath *)indexPath configred:(BOOL)configred {
    NSString *cellBrand = [NSStringFromClass([model class]) stringByAppendingString:@"Cell"];
    // 名称为空时返回空
    if (model == nil) {
        return nil;
    }
    // cell存在 取出cell
    if ([NSClassFromString(cellBrand) class]) {
        GCBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellBrand forIndexPath:indexPath];
        // 是否根据model对cell上控件赋值
        if (configred) {
            [cell setDataWithModel:model];
        }
        return cell;
    }
    return nil;
}
@end
