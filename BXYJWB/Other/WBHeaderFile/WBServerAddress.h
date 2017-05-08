//
//  WBServerAddress.h
//  BXYJWB
//
//  Created by MS on 17/1/10.
//  Copyright © 2017年 yxkjios. All rights reserved.
//

#ifndef WBServerAddress_h
#define WBServerAddress_h

#pragma mark - 服务器地址
#define ROOT_URL  @"192.168.1.20"



#pragma mark - 用户写入操作
#define USER_WRITE_URL  [NSString stringWithFormat:@"http://%@/WBcum/ws/WriteMsg?wsdl",ROOT_URL]
#define USER_WRITE_NS   @"http://service.bxyj.com/"

#pragma mark - 用户读取操作 
#define USER_READ_URL   [NSString stringWithFormat:@"http://%@/WBcum/ws/ReadMsg?wsdl",ROOT_URL]
#define USER_READ_NS    @"http://service.bxyj.com/"
#endif /* WBServerAddress_h */
