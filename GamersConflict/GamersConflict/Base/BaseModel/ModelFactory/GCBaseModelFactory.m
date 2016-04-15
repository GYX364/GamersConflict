//
//  GCBaseModelFactory.m
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseModelFactory.h"
#import "GCBaseModel.h"

@implementation GCBaseModelFactory

+ (GCBaseModel *)modelProducedWithModelBrand:(NSString *)brand assignmentedWithOptions:(NSDictionary *)options {
    // 根据model名称创建对应model对象
    GCBaseModel *model = [[NSClassFromString(brand) alloc] init];
    // 根据options为model中对应属性赋值
    [model setValuesForKeysWithDictionary:options];
    
    return model;
}

@end
