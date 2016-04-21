//
//  GCNewsSubModel.h
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/16.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCBaseModel.h"

@interface GCNewsSubModel : GCBaseModel

@property (nonatomic, strong) NSString *aid;
@property (nonatomic, strong) NSString *subModel_description;
@property (nonatomic, strong) NSString *html5;
@property (nonatomic, strong) NSString *litpic;
@property (nonatomic, strong) NSString *longtitle; //description
@property (nonatomic, strong) NSString *pubdate;
@property (nonatomic, strong) NSString *source;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *murl;
@property (nonatomic, strong) id type;
@property (nonatomic, strong) NSMutableArray *showitem;
@property (nonatomic, strong) NSString *writer;
@property (nonatomic, strong) NSString *timer;
@property (nonatomic, strong) NSString *click;
@property (nonatomic, strong) NSString *comment;
@property (nonatomic, strong) NSString *showtype;
@property (nonatomic, strong) NSMutableArray *showItems;

@end
