//
//  AppDelegate.swift
//  CocoaLumberjack_Demo
//
//  Created by xiaohui on 2017/3/8.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        /*
         
        // 1.简单测试
        
        // 配置DDLog对象
        DDLog.add(DDTTYLogger.sharedInstance) // TTY = Xcode console
        DDLog.add(DDASLLogger.sharedInstance) // ASL = Apple System Logs
        
        // 使用CocoaLumberjack中的函数在终端打印日志信息
        DDLogVerbose("Verbose");
        DDLogDebug("Debug");
        DDLogInfo("Info");
        DDLogWarn("Warn");
        DDLogError("Error");

        // 将CocoaLumberjack中打印的日志信息输出到文件中
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.maximumFileSize = 1024 * 1024
        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24)
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        
        // 输出日志文件路径和文件名
        DDLogInfo(fileLogger.currentLogFileInfo.filePath)
        DDLogInfo(fileLogger.currentLogFileInfo.fileName)
         
        */
        
        
        
        // 2.按招自定义的格式来输出日志
        
        // 初始化自定义的格式对象
        let formatter = XHLogFormatter()
        
        // 添加输出到Xcode控制台
        DDTTYLogger.sharedInstance.logFormatter = formatter
        DDLog.add(DDTTYLogger.sharedInstance)
        
        // 添加输出到Console
        DDASLLogger.sharedInstance.logFormatter = formatter
        DDLog.add(DDASLLogger.sharedInstance)
        
        // 添加输出到文件
        let fileLogger: DDFileLogger = DDFileLogger()
        fileLogger.maximumFileSize = 1024 * 1024
        fileLogger.rollingFrequency = TimeInterval(60 * 60 * 24)
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        fileLogger.logFormatter = formatter
        DDLog.add(fileLogger)
        
        // 添加输出到数据库
        let dbLogger = DDAbstractDatabaseLogger()
        dbLogger.logFormatter = formatter
        DDLog.add(dbLogger)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

