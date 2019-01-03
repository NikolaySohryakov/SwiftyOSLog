//
//  SwiftyOSLogCoordinator.swift
//  SwiftyOSLog
//
//  Created by Nikolay Sohryakov on 03/01/2019.
//

import Foundation
import os.log

public class SwiftyOSLogCoordinator {
    public static var shared: SwiftyOSLogCoordinator {
        return SwiftyOSLogCoordinator()
    }
    
    private var map: [String: SwiftyOSLog] = [:]
    
    private init() {}
    
    public func log(for subsystem: Subsystem, category: Category) -> SwiftyOSLog {
        let id = identifierFrom(subsystem: subsystem, category: category)
        
        guard let log = map[id] else {
            let log = SwiftyOSLog(subsystem: subsystem, category: category)
            map[id] = log
            return log
        }
        
        return log
    }
    
    public func release(log: SwiftyOSLog) {
        guard let index = map.values.firstIndex(where: { $0 == log }) else {
            return
        }
        
        map.remove(at: index)
    }
    
    private func identifierFrom(subsystem: Subsystem, category: Category) -> String {
        return "\(subsystem.name)-\(category.name)"
    }
}
