//
//  Category.swift
//  SwiftyOSLog
//
//  Created by Nikolay Sohryakov on 03/01/2019.
//

import Foundation

public struct Category {
    public var name: String
    
    public init(_ name: String) {
        self.name = name
    }
    
    public static var empty: Category = Category("")
    public static var `default`: Category = Category("default")
}

extension Category: Equatable {
    public static func == (lhs: Category, rhs: Category) -> Bool {
        return lhs.name == rhs.name
    }
}
