//
//  GCUrlHeadersDefine.h
//  GamersConflict
//
//  Created by GYX364 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#ifndef GCUrlHeadersDefine_h
#define GCUrlHeadersDefine_h

// 一. 推荐模块
#define GCRecommendURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&id=318263,318432,318079,318118,318066&t=1459951762&appid=7&appver=2.1"
#define GCRecommendMoreURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&id=318263,318432,318079,318118,318066&t=1459951762&appid=7&appver=2.1&start=30"

// 二.网游模块
#define GCOnlineGameURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%BD%91%E6%B8%B8&id=318072&t=1460107822&appid=7&appver=2.1"
#define GCOnlineGameMoreURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%BD%91%E6%B8%B8&id=318072&t=1460107822&appid=7&appver=2.1&start=20"

// 三.手游模块
#define GCMobileGameURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E6%89%8B%E6%B8%B8&id=&t=1460114420&appid=7&appver=2.1"
#define GCMobileGameMoreURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E6%89%8B%E6%B8%B8&id=&t=1460114420&appid=7&appver=2.1&start=20"

// 四.单机模块
#define GCPCGameURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E5%8D%95%E6%9C%BA&id=317931&t=1460114761&appid=7&appver=2.1"
#define GCPCGameMoreURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E5%8D%95%E6%9C%BA&id=317931&t=1460114761&appid=7&appver=2.1&start=20"

// 五.电竞模块
#define GCESportsURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%94%B5%E7%AB%9E&id=317719,317937&t=1460115045&appid=7&appver=2.1"
#define GCESportsMoreURL @"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%94%B5%E7%AB%9E&id=317719,317937&t=1460115045&appid=7&appver=2.1&start=20"

// 六.cell
#define GCCell(cellId) [NSString stringWithFormat:@"http://api.tuwan.com/app/?aid=%@&appid=7",cellid] 

// 七.登陆 (POST loginmode=username&password=6251728&platform=mobile&t=login&userName=gyx364)
#define GCLogin @"http://user.tuwan.com/api/action.ashx"

// 八.注册 (POST code=tuwan&loginmode=username&password=6251728&t=register&userName=gyx365)
#define GCRegister @"http://user.tuwan.com/api/action.ashx"

// 九.搜索
#define GCSearch @"http://api.tuwan.com/app/?class=search&appid=7&keywords=dota"

#endif /* GCUrlHeadersDefine_h */
