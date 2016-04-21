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
#import "GCNewsSubModel.h"

#define kAllCell @"GCNewsAllCell"
#define kVideoCell @"GCNewsVideoCell"
#define kPicCell @"GCNewsPicCell"

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

+ (GCBaseTableViewCell *)cellProducedWithModel:(GCBaseModel*)model forTableView:(UITableView *)tableView cellIndexPath:(NSIndexPath *)indexPath configred:(BOOL)configred {
    if (model == nil) {
        return nil;
    }
    
    GCNewsSubModel *subModel = (GCNewsSubModel *)model;
    if ([subModel.showtype isEqualToString:@"1"]) {
        
        GCBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPicCell forIndexPath:indexPath];
        [cell setDataWithModel:subModel];
        return cell;
    }
    
    GCBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kAllCell forIndexPath:indexPath];
    [cell setDataWithModel:subModel];
    
    return cell;
}

+ (BOOL)registerCellFortableView:(UITableView *)tableview {
    [tableview registerNib:[UINib nibWithNibName:kAllCell bundle:nil] forCellReuseIdentifier:kAllCell];
    [tableview registerNib:[UINib nibWithNibName:kVideoCell bundle:nil] forCellReuseIdentifier:kVideoCell];
    [tableview registerNib:[UINib nibWithNibName:kPicCell bundle:nil] forCellReuseIdentifier:kPicCell];
    
    return YES;
}

@end
