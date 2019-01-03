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
    public private(set) var subsystem: Subsystem?
    public private(set) var category: Category?
    
    //region Init
    
    public static var `default`: SwiftyOSLog {
        return SwiftyOSLog(log: OSLog.default)
    }
    
    public init(subsystem: Subsystem, category: Category) {
        self.subsystem = subsystem
        self.category = category
        
        log = OSLog(subsystem: subsystem.name, category: category.name)
    }
    
    public init(log: OSLog) {
        self.log = log
    }
    
    //endregion
    
    //region Default
     
    public func `default`(_ format: StaticString, _ args: CVarArg...) {
        log(format, type: .default, args)
    }
    
    //endregion
    
    //region Info
    
    public func info(_ format: StaticString, _ args: CVarArg...) {
        log(format, type: .info, args)
    }
    
    //endregion
    
    //region Debug
    
    public func debug(_ format: StaticString, _ args: CVarArg...) {
        log(format, type: .debug, args)
    }
    
    //endregion
    
    //region Error
    
    public func error(_ format: StaticString, _ args: CVarArg...) {
        log(format, type: .error, args)
    }
    
    //endregion
    
    //region Fault
    
    public func fault(_ format: StaticString, _ args: CVarArg...) {
        log(format, type: .fault, args)
    }
    
    //endregion
    
    //region Log
    
    public func log(_ format: StaticString, type: OSLogType, _ passedArgs: CVarArg...) {
        //At some point we have passedArgs as an array of array. Need to flat it checking types,
        //that's why functional approach is not suitable here.
        let args: [CVarArg]
        if passedArgs.count == 1, let _args = passedArgs.first as? [CVarArg] {
            args = _args
        }
        else {
            args = passedArgs
        }
        
        // When passing `args` directly to os_log, it does crash with an unknown error.
        // This simple and silly solution makes it possible to pass up to 10 arguments to os_log.
        switch args.count {
        case 0:
            os_log(format, log: log, type: type)
        case 1:
            print("Args[0] = \(args[0])")
            print("Format: \(format)")
            os_log(format, log: log, type: type, args[0])
        case 2:
            os_log(format, log: log, type: type, args[0], args[1])
        case 3:
            os_log(format, log: log, type: type, args[0], args[1], args[2])
        case 4:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3])
        case 5:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3], args[4])
        case 6:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3], args[4], args[5])
        case 7:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3], args[4], args[5], args[6])
        case 8:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7])
        case 9:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8])
        case 10:
            os_log(format, log: log, type: type, args[0], args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9])
        default:
            os_log(format, log: log, type: type, args)
        }
    }
    
    //endregion
}

extension SwiftyOSLog: Equatable {
    public static func == (lhs: SwiftyOSLog, rhs: SwiftyOSLog) -> Bool {
        return lhs.subsystem == rhs.subsystem && lhs.category == rhs.category
    }
}
