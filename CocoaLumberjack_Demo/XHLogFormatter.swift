//
//  XHLogFormatter.swift
//  CocoaLumberjack_Demo
//
//  Created by xiaohui on 2017/3/9.
//  Copyright © 2017年 xiaohui. All rights reserved.
//

import UIKit

class XHLogFormatter: NSObject, DDLogFormatter {

    func format(message logMessage: DDLogMessage) -> String? {
        
        var logLevel = ""
        
        switch logMessage.flag {
            
        case DDLogFlag.debug:
            logLevel = "[Debug] -> "
            break
            
        case DDLogFlag.info:
            logLevel = "[Info] -> "
            break
            
        case DDLogFlag.warning:
            logLevel = "[Warning] -> "
            break
            
        case DDLogFlag.error:
            logLevel = "[Error] -> "
            break
            
        default:
            logLevel = "[Verbose] -> "
            break
        }
        
        let formatterString = logLevel + logMessage.fileName + " -> " + logMessage.function + " -> " + "\(logMessage.line)" + " -> " + logMessage.message
    
        return formatterString
    }
    
}
