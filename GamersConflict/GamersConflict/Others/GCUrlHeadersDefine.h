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
#define GCRecommendURL [NSString stringWithFormat:@"http://api.tuwan.com/app/?appid=7&class=cookielike&id=321788,321586,321509,321011,320853&t=%.f&appid=7&appver=2.1", [[NSDate date] timeIntervalSince1970]]
#define GCRecommendMoreURL(i) [NSString stringWithFormat:@"http://api.tuwan.com/app/?appid=7&class=cookielike&id=321788,321586,321509,321011,320853&t=%.f&appid=7&appver=2.1&start=%ld", [[NSDate date] timeIntervalSince1970], i]

// 二.网游模块
#define GCOnlineGameURL [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%BD%91%E6%B8%B8" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1", [[NSDate date] timeIntervalSince1970]]]
#define GCOnlineGameMoreURL(i) [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%BD%91%E6%B8%B8" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1&start=%ld", [[NSDate date] timeIntervalSince1970], i]]

// 三.手游模块
#define GCMobileGameURL [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%BD%91%E6%B8%B8" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1", [[NSDate date] timeIntervalSince1970]]]
#define GCMobileGameMoreURL(i) [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%BD%91%E6%B8%B8" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1&start=%ld", [[NSDate date] timeIntervalSince1970], i]]

// 四.单机模块
#define GCPCGameURL [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E5%8D%95%E6%9C%BA" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1", [[NSDate date] timeIntervalSince1970]]]
#define GCPCGameMoreURL(i) [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E5%8D%95%E6%9C%BA" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1&start=%ld", [[NSDate date] timeIntervalSince1970], i]]

// 五.电竞模块
#define GCESportsURL [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%94%B5%E7%AB%9E" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1", [[NSDate date] timeIntervalSince1970]]]
#define GCESportsMoreURL(i) [@"http://api.tuwan.com/app/?appid=7&class=cookielike&mod=%E7%94%B5%E7%AB%9E" stringByAppendingString:[NSString stringWithFormat:@"&id=321639&t=%.f&appid=7&appver=2.1&start=%ld", [[NSDate date] timeIntervalSince1970], i]]

// 六.cell
#define GCCell(cellId) [NSString stringWithFormat:@"http://api.tuwan.com/app/?aid=%@&appid=7",cellid] 

// 七.登陆 (POST loginmode=username&password=6251728&platform=mobile&t=login&userName=gyx364)
#define GCLogin @"http://user.tuwan.com/api/action.ashx"

// 八.注册 (POST code=tuwan&loginmode=username&password=6251728&t=register&userName=gyx365)
#define GCRegister @"http://user.tuwan.com/api/action.ashx"

// 九.搜索
#define GCSearch @"http://api.tuwan.com/app/?class=search&appid=7&keywords=dota"

#endif /* GCUrlHeadersDefine_h */
