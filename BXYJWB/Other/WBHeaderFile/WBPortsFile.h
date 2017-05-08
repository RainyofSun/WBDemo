//
//  WBPortsFile.h
//  BXYJWB
//
//  Created by MS on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#ifndef WBPortsFile_h
#define WBPortsFile_h

//接口文件
#import "WBServerAddress.h"

#pragma mark - 用户写入操作
/**
 * 给口令添加资源
 * @param parent      String
 * @param token       String    口令
 * @param uids        String
 */
#define ADD_RESOURCE_MT     @"addResource"
/**
 * 删除口令下的资源
 * @param token       String
 * @param uids        String
 */
#define DELETE_RESOURCE_MT  @"deleteResource"
/**
 * 删除口令
 * @param token       String
 */
#define DELETE_TOKEN_MT     @"deleteToken"
/**
 *  发一条微博
 * @param accessToken String
 * @param content     String
 */
#define SEND_WB_MT          @"sendArticle"
/**
 * 获取用户最新的微博
 * @param accessToken String
 * @param uid         String
 */
#define GET_LASTWB_MT       @"getLastWb"
/**
 * 在指定微博下发布一条评论
 * @param accessToken String
 * @param mid         String
 * @param content     String
 */
#define SEND_COMMENT_MT     @"createComment"
/**
 * 添加口令
 * @param name        String
 * @param parent      String
 */
#define ADD_TOKEN_MT        @"addToken"

#pragma mark - 用户读取操作
/**
 * 根据口令获取资源
 * @param token       String    输入的口令
 * @param start       String    开始的编号（第几个资源）0->下拉刷新时使用
 * @param gived       String    显示分配的资源（0 已分配，1 未分配）
 * @param nogive      String    显示未分配的资源（0 已分配，1 未分配）
 */
#define GET_RESOURCE_MT     @"getResource"
/**
 * 获取属于自己的口令
 * @param token       String
 */
#define GET_MYTOKEN_MT      @"getMyTokens"
#endif /* WBPortsFile_h */
