//
//  GCNewsShowItem.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/21.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseModel.h"

typedef struct InfoSize {
    float width;
    float height;
}Info;

@interface GCNewsShowItem : GCBaseModel

@property (nonatomic)  Info picSize;
@property (nonatomic, strong) NSDictionary *info;
@property (nonatomic, strong) NSString *pic;
@property (nonatomic, strong) NSString *text;

@end
