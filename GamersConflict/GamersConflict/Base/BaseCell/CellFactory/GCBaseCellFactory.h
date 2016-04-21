//
//  GCBaseCellFactory.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UITableView;
@class GCBaseTableViewCell;
@class GCBaseModel;
@class GCNewsSubModel;

typedef NS_ENUM(NSInteger, RegisterType) {
    RegisterTypeNib,
    RegisterTypeClass,
};

@interface GCBaseCellFactory : NSObject

/**
 *  tableView 注册cell, 注册的cell的类为 modelbrand＋"Cell"   e.g. 参数modelBrand为GCBaseModel时, 则注册GCBaseModelCell这个类, 且reuseIdentifier为GCBaseModelCell(类名).
 *
 *  @param tableview    需要注册cell的tableView
 *  @param registeringType 注册nib 活着 class
 *  @param model        根据model注册对应cell
 *
 *  @return 注册成功返回YES, 注册失败返回NO.
 */
+ (BOOL)tableView:(UITableView *)tableview registeringType:(RegisterType)registeringType withModel:(GCBaseModel *)model;

/**
 *  根据model创建对应tableViewCell
 *
 *  @param model     model
 *  @param tableView cell出列时所在tableView
 *  @param indexPath cell的indexPath
 *  @param configred  是否根据model设置cell
 *
 *  @return GCBaseTableViewCell类对象或其子类对象
 */
+ (GCBaseTableViewCell *)cellProducedWithModel:(GCBaseModel *)model forTableView:(UITableView *)tableView cellIndexPath:(NSIndexPath *)indexPath configred:(BOOL)configred;

+ (BOOL)registerCellFortableView:(UITableView *)tableview;
@end
