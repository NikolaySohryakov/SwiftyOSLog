//: [Previous](@previous)

import Foundation
import SwiftyOSLog

let subsystem = Subsystem("com.your_company.subsystem_name")
let category = Category("Chat")
let log = SwiftyOSLog(subsystem: subsystem, category: category)

log.default("Default message")
log.info("Info message")
log.debug("Debug message")
log.error("Error message")
log.fault("Fault message")
//: [Next](@next)
