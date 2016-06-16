//
//  NSURLSessionTest.m
//  NSURLSessionTest
//
//  Created by Lycodes_Dong on 6/16/16.
//  Copyright © 2016 Dong. All rights reserved.
//

#import "NSURLSessionTest.h"

@implementation NSURLSessionTest

#pragma mark NSURLSessionDataTask

- (void)useNSURLSessionDataTaskWithURLString:(NSString *)urlstring {

    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
        
        if (error == nil) {
        
            NSArray *arrayJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
            
            [self finishDataTaskWithJson:arrayJson];
            
        }
        
    }];
    
    [task resume];
    
    NSLog(@"Start DataTask...");

}

- (void)finishDataTaskWithJson:(NSArray *)array {

    NSLog(@"Finish DataTask...");
    
    NSLog(@"%@",array);

}

#pragma mark NSURLSessionDownloadTask

- (void)useNSURLSessionDownloadTaskWithURLString:(NSString *)urlstring {

    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *task = [session downloadTaskWithRequest:request completionHandler:^(NSURL *location,NSURLResponse *response,NSError *error){
    
        NSData *data = [NSData dataWithContentsOfURL:location];
    
        [self finishDownloadTaskWithNSData:data];
        
    }];
    
    [task resume];
    
    NSLog(@"Start DownloadTas...");

}

- (void)finishDownloadTaskWithNSData:(NSData *)data {

    NSLog(@"Finish DownloadTask...");

}

#pragma mark NSURLSessionUploadTask

- (void)useNSURLSessionUploadTaskWithURLString:(NSString *)urlstring Data:(NSData *)data {

    NSURL *url = [NSURL URLWithString:urlstring];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:data completionHandler:^(NSData *data,NSURLResponse *response,NSError *error){
    
        [self finishUploadTask];
    
    }];
    
    [task resume];
    
    NSLog(@"Finish UploadTask...");
    
}

- (void)finishUploadTask {

    NSLog(@"Finish UploadTask...");

}

@end
