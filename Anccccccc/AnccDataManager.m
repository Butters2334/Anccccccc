//
//  AnccDataManager.m
//  Anccccccc
//
//  Created by Ancc on 14/12/18.
//  Copyright (c) 2014年 Ancc. All rights reserved.
//

#import "AnccDataManager.h"
#import "YTKKeyValueStore.h"
///////////////////////////////////////////////////////////////////////////////////////////
#define DB_PATH [NSHomeDirectory() stringByAppendingPathComponent:@"Xcode_Plug_in.sqlite"]
#define DB_TABLENAME @"user_ancc_key_value"
///////////////////////////////////////////////////////////////////////////////////////////
@implementation AnccDataManager
+(NSArray *)allKey
{
    YTKKeyValueStore *store= [[YTKKeyValueStore alloc]initWithDBWithPath:DB_PATH];
    [store createTableWithName:DB_TABLENAME];
    NSArray *array = [store getAllIdFromTable:DB_TABLENAME];
    
    return [array sortedArrayUsingComparator:^(NSString * obj1, NSString * obj2){
        return (NSComparisonResult)[obj1 compare:obj2 options:NSNumericSearch];
    }];
}

+(BOOL)containKey:(NSString *)key
{
    return [[self allKey]containsObject:key];
}
+(NSString *)valueForKey:(NSString *)key
{
    YTKKeyValueStore *store= [[YTKKeyValueStore alloc]initWithDBWithPath:DB_PATH];
    [store createTableWithName:DB_TABLENAME];
    NSDictionary *json = [store getObjectById:key fromTable:DB_TABLENAME];
    return json[@"value"];
}
+(NSString *)descriptionForKey:(NSString *)key
{
    YTKKeyValueStore *store= [[YTKKeyValueStore alloc]initWithDBWithPath:DB_PATH];
    [store createTableWithName:DB_TABLENAME];
    NSDictionary *json = [store getObjectById:key fromTable:DB_TABLENAME];
    return json[@"description"];
}
+(void)setString:(NSString *)value forKey:(NSString *)key andDescription:(NSString *)description
{
    key=key.length==0?@"":key;
    value=value.length==0?@"":value;
    description=description.length==0?@"":description;
    NSDictionary *json = @{@"key":key,@"value":value,@"description":description};
    YTKKeyValueStore *store= [[YTKKeyValueStore alloc]initWithDBWithPath:DB_PATH];
    [store createTableWithName:DB_TABLENAME];
    [store putObject:json withId:key intoTable:DB_TABLENAME];
}
+(void)removeStringForKey:(NSString *)key
{
    YTKKeyValueStore *store= [[YTKKeyValueStore alloc]initWithDBWithPath:DB_PATH];
    [store createTableWithName:DB_TABLENAME];
    [store deleteObjectById:key fromTable:DB_TABLENAME];
}
@end



