//
//  AnccDataManager.h
//  Anccccccc
//
//  Created by Ancc on 14/12/18.
//  Copyright (c) 2014年 Ancc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AnccDataManager : NSObject
/**
 *  @author Anccccccc, 14-12-18 11:12:25
 *
 *  不管数据之后以什么形式存储,都是需要本类对外交互,基本模式是key_value的形式
 *
 *  @return 返回存储数据所有的key
 */
+(NSArray *)allKey;
/**
 *  @author Anccccccc, 14-12-18 11:12:15
 *
 *  判断是否在数据中有对应的key,为了节省运算性能,这里直接使用key来对比,之后再考虑扩展
 *
 *  @param key 需要判断的key
 *
 *  @return 输入key是否在数据库中有对应的value
 */
+(BOOL)containKey:(NSString *)key;
/**
 *  @author Anccccccc, 14-12-18 11:12:16
 *
 *  获取key在数据库中的value
 *
 *  @param key -
 *
 *  @return -
 */
+(NSString *)valueForKey:(NSString *)key;
+(NSString *)descriptionForKey:(NSString *)key;
/**
 *  @author Anccccccc, 14-12-18 11:12:38
 *
 *  添加字段到数据库中
 *
 *  @param value -
 *  @param key   -
 */
+(void)setString:(NSString *)value forKey:(NSString *)key andDescription:(NSString *)description;
/**
 *  @author Anccccccc, 14-12-18 11:12:54
 *
 *  删除对应的数据
 *
 *  @param key -
 */
+(void)removeStringForKey:(NSString *)key;
@end

