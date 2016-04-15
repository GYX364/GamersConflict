//
//  GCBaseModelFactory.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class GCBaseModel;

@interface GCBaseModelFactory : NSObject

/**
 *  根据model的brand创建对应的model并赋值
 *
 *  @param brand   model类名
 *  @param options model属性的值的字典
 *
 *  @return GCBaseModel类对象或其子类对象
 */
+ (GCBaseModel *)modelProducedWithModelBrand:(NSString *)brand assignmentedWithOptions:(NSDictionary *)options;

@end
