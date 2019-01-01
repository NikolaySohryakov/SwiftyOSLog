//
//  SwiftyOSLog.swift
//  SwiftyOSLog
//
//  Created by Nikolay Sohryakov on 01/01/2019.
//

import Foundation
import os.log

public class SwiftyOSLog {
    private var log: OSLog
    
    //region Init
    
    public static var `default`: SwiftyOSLog {
        return SwiftyOSLog(log: OSLog.default)
    }
    
    public init(subsystem: String, category: String) {
        log = OSLog(subsystem: subsystem, category: category)
    }
    
    public init(log: OSLog) {
        self.log = log
    }
    
    //endregion
    
    //region Info
    
    public func info(_ message: String) {
        log(message, type: .info)
    }
    
    public func info(_ message: StaticString) {
        log(message, type: .info)
    }
    
    //endregion
    
    //region Debug
    
    public func debug(_ message: String) {
        log(message, type: .debug)
    }
    
    public func debug(_ message: StaticString) {
        log(message, type: .debug)
    }
    
    //endregion
    
    //region Error
    
    public func error(_ message: String) {
        log(message, type: .error)
    }
    
    public func error(_ message: StaticString) {
        log(message, type: .error)
    }
    
    //endregion
    
    //region Fault
    
    public func fault(_ message: String) {
        log(message, type: .fault)
    }
    
    public func fault(_ message: StaticString) {
        log(message, type: .fault)
    }
    
    //endregion
}

private extension SwiftyOSLog {
    func log(_ message: String, type: OSLogType) {
        os_log("%{public}@", log: log, type: type, message)
    }
    
    func log(_ message: StaticString, type: OSLogType) {
        os_log(message, log: log, type: type)
    }

}