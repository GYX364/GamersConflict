//
//  GCNewsSuperView.m
//  GamersConflict
//
//  Created by 无敌贺宝 on 16/4/15.
//  Copyright © 2016年 com.gamersconflict.gc. All rights reserved.
//

#import "GCNewsSuperView.h"
#import "GCNewsSubView.h"
#import "GCNewsModel.h"

#import <AFNetworking.h>

@interface GCNewsSuperView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray *articlesList;

@property (nonatomic, strong) AFHTTPSessionManager *netManager;

@end

@implementation GCNewsSuperView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSMutableArray *)articlesList {
    if (_articlesList == nil) {
        _articlesList = [NSMutableArray array];
    }
    return _articlesList;
}

- (instancetype)initWithFrame:(CGRect)frame classes:(NSMutableArray *)classes
{
    self = [super initWithFrame:frame];
    if (self) {
        if (classes.count > 0) {
            self.articlesList = classes;
            self.currentIndex = -1;
            self.netManager = [AFHTTPSessionManager manager];
            self.netManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"application/x-json",@"text/html", nil];
            [self settingScrollView];
            [self addSubview];
        }
    }
    return self;
}

- (void)settingScrollView {
    self.delegate = self;
    self.contentSize = CGSizeMake(ScreenWidth * self.articlesList.count, 0);
    self.contentOffset = CGPointMake(0, 0);
    self.pagingEnabled = YES;
    self.showsHorizontalScrollIndicator = NO;
    self.autoresizesSubviews = YES;
    [self scrollViewDidEndDecelerating:self];
}

- (void)addSubview {
    for (NSInteger i = 0; i < self.articlesList.count; i ++) {
        GCNewsSubView *subView = [[[NSBundle mainBundle] loadNibNamed:@"GCNewsSubView" owner:nil options:nil] firstObject];
        subView.frame = CGRectMake(ScreenWidth * i + 5, 44, ScreenWidth - 10, ScreenHeight - 64 - 80 - 5);
        
//        GCNewsSubView *subView = [[GCNewsSubView alloc] initWithFrame:CGRectMake(ScreenWidth * i + 5, 44, ScreenWidth - 10, ScreenHeight - 64 - 80 - 5)];
        
        [self addSubview:subView];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = [self indexWithScrollView:scrollView];
//    NSLog(@"%ld", self.currentIndex);
//    NSLog(@"%ld", index);
    if (self.currentIndex != index) {
        self.currentIndex = index;
        GCNewsModel *model = self.articlesList[index];
        if (model.isRequested == NO || model.newsDictioary.allKeys.count == 0) {
            
            [self.netManager GET:model.classUrl parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                id newsDic = responseObject;
                if ([newsDic isKindOfClass:[NSDictionary class]] && newsDic != nil) {
                    model.newsDictioary = (NSMutableDictionary *)newsDic;
                    GCNewsSubView *subView = self.subviews[self.currentIndex];
                    [subView setDataWithModel:model];
                }
//                NSLog(@"%@", responseObject);
            } failure:nil];
            
//            NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:model.classUrl]] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//                id newsDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//                if ([newsDic isKindOfClass:[NSDictionary class]] && newsDic != nil) {
//                    model.newsDictioary = (NSMutableDictionary *)newsDic;
//                    GCNewsSubView *subView = self.subviews[self.currentIndex];
//                    [subView setDataWithModel:model];
//                }
////                NSLog(@"%@", newsDic);
//            }];
//            [task resume];
            
            model.isRequested = YES;
        }
    }
}

- (NSInteger)indexWithScrollView:(UIScrollView *)scrollView {
    return scrollView.contentOffset.x / ScreenWidth;
}

@end
