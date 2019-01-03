//: [Previous](@previous)

import Foundation
import SwiftyOSLog

let log = SwiftyOSLog.default

log.default("%{private}@ - %{public}@", "Private Part", "Public Part")
log.info("This Info message logged at %{time_t}d", Date().timeIntervalSince1970)
log.debug("Debug message")
log.error("Error message")
log.fault("Fault message")

//: [Next](@next)
