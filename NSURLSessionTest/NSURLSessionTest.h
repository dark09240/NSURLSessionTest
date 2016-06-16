//
//  NSURLSessionTest.h
//  NSURLSessionTest
//
//  Created by Lycodes_Dong on 6/16/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLSessionTest : NSObject

//NSURLSessionDataTask
- (void)useNSURLSessionDataTaskWithURLString:(NSString *)urlstring;

//NSURLSessionDownloadTask
- (void)useNSURLSessionDownloadTaskWithURLString:(NSString *)urlstring;

//NSURLSessionUploadTask
- (void)useNSURLSessionUploadTaskWithURLString:(NSString *)urlstring Data:(NSData *)data;

@end
