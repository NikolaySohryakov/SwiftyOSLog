//
//  Subsystem.swift
//  SwiftyOSLog
//
//  Created by Nikolay Sohryakov on 03/01/2019.
//

import Foundation

public struct Subsystem {
    public var name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public static var current: Subsystem = Subsystem(Bundle.main.bundleIdentifier ?? "")
}

extension Subsystem: Equatable {
    public static func == (lhs: Subsystem, rhs: Subsystem) -> Bool {
        return lhs.name == rhs.name
    }
}
