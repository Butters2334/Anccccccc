//
//  AnccDataManager.m
//  Anccccccc
//
//  Created by Ancc on 14/12/18.
//  Copyright (c) 2014年 Ancc. All rights reserved.
//

#import "AnccDataManager.h"
///////////////////////////////////////////////////////////////////////////////////////////
@interface AnccDataManager(data)
//+ (instancetype)sharedInstance;
//@property (nonatomic,strong)NSMutableDictionary *kvData;
+(NSMutableDictionary *)kvData;
@end
@implementation AnccDataManager
//+ (instancetype)sharedInstance {
//    static dispatch_once_t onceToken;
//    static AnccDataManager *instance = nil;
//    dispatch_once(&onceToken, ^{
//        instance = [[AnccDataManager alloc] init];
//    });
//    return instance;
//}

//-(instancetype)init
//{
//    self = [super init];
//    self.kvData = @{
//                    @"key1":@"value1",
//                    @"key2":@"value2",
//                    @"key3":@"value3"}.mutableCopy;
//    return self;
//}
+(NSMutableDictionary *)kvData
{
    static NSMutableDictionary *kv_data =nil;
    if(kv_data==nil)
    {
        kv_data=@{@"key1":@"value1",
                  @"key2":@"value2",
                  @"key3":@"value3"}.mutableCopy;
    }
    return kv_data;
}

///////////////////////////////////////////////////////////////////////////////////////////

+(NSArray *)allKey
{
    return [self.kvData.allKeys sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
        return (NSComparisonResult)[obj1 compare:obj2 options:NSNumericSearch];
    }];
}
+(BOOL)containKey:(NSString *)key
{
    return [[self allKey]containsObject:key];
}
+(NSString *)valueForKey:(NSString *)key
{
    return [self.kvData objectForKey:key];
}
+(void)setString:(NSString *)value forKey:(NSString *)key
{
    [self.kvData setValue:value forKey:key];
}
+(void)removeStringForKey:(NSString *)key
{
    [self.kvData removeObjectForKey:key];
}
@end



