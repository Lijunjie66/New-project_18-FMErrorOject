//
//  main.m
//  New-project_18-FMErrorOject
//
//  Created by Geraint on 2018/5/2.
//  Copyright © 2018年 kilolumen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define FILE_PATH @"/NoSuchFile.txt"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
        // 用一个NSFileManager 实例方法从文件系统中删除了一个文件。如果在调用该方法时出现错误，那么这段代码就会通过间接方式返回错误对象和相应的结果
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        NSError *fileErr;
        BOOL success = [fileMgr removeItemAtPath:FILE_PATH error:&fileErr];
        if (!success) {
            NSString *desciption = [fileErr localizedDescription];
            NSString *domain = [fileErr domain];
            NSInteger code = [fileErr code];
            NSDictionary *info = [fileErr userInfo];
            NSURL *failedPath = (NSURL *)[info objectForKey:NSFilePathErrorKey];
            NSLog(@"\n*** ERROR ***\nDescription-> %@\nPath-> %@\nDomain-> %@\nCode-> %li",desciption, failedPath, domain, code);
        }
        
        /*
         
         输出结果：
         *** ERROR ***
         Description-> “NoSuchFile.txt” couldn’t be removed.
         Path-> /NoSuchFile.txt
         Domain-> NSCocoaErrorDomain
         Code-> 4
         
         */
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
