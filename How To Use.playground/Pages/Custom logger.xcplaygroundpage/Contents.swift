//: [Previous](@previous)

import Foundation
import SwiftyOSLog

let subsystem = "com.your_company.subsystem_name"
let category = "Chat"
let log = SwiftyOSLog(subsystem: subsystem, category: category)

log.info("Info message")
log.debug("Debug messadge")
log.error("Error message")
log.fault("Fault message")
//: [Next](@next)
