//: [Previous](@previous)

import Foundation
import SwiftyOSLog

let subsystem = Subsystem.current
let category = Category.default
let log = SwiftyOSLogCoordinator.shared.log(for: subsystem, category: category)

log.info("Info message")
log.debug("Debug message")
log.error("Error message")
log.fault("Fault message")

//: [Next](@next)
