<p align="center">
    <img src="https://github.com/NikolaySohryakov/SwiftyOSLog/blob/master/img/Console-screenshot.png">
</p>
<p align="center">
  <img src="https://img.shields.io/badge/Language-Swift_4-orange.svg">
  <img src="https://img.shields.io/badge/License-MIT-green.svg">
</p>

# About

Built on top of iOS/OS X `os_log` SwiftyOSLog makes use of it easy and laconic.

# Features

* Powered by `os_log`
* Different logging levels: `default`, `info`, `debug`, `error`, `fault`
* Supports macOS `Console` GUI or `log` comman line tool
* Takes care of a different loggers

# Usage

#### Import package

```swift
import SwiftyOSLog
```

#### Initialize logger

Use default logger

```swift
let log = SwiftyOSLog.default
```
or a logger for a specific subsystem and category
```swift
let subsystem = Subsystem("com.your_company.subsystem_name")
let category = Category("Chat")
let log = SwiftyOSLog(subsystem: subsystem, category: category)
```
or let `SwiftyOSLogCoordinator` manage all your loggers:
```swift
let subsystem = Subsystem.current
let category = Category.default
let log = SwiftyOSLogCoordinator.shared.log(for: subsystem, category: category)
```

#### Log

Logging mechanism is fully compatible to what's described at [Logging | Apple Developer Documentation](https://developer.apple.com/documentation/os/logging).

Log messages should be of `StaticString` type:

```swift
log.info("Info message")
```

In case if you need a more complex message, use format specifiers described at [Formatting Log Messages](https://developer.apple.com/documentation/os/logging#1682416):
```swift
log.default("%{public}@", "Formatted message")
```

#### Respect privacy

Apple provide developers with two access modifiers: `%{public}` and `%{private}`.
Dynamic strings and complex dynammic objects are considered as prived by default and are not collected automatically. More details can be found at [Privacy](https://developer.apple.com/documentation/os/logging#1841411) section of Apple Developer Documentation.

# License
This library is licensed under MIT. Full license text is available in [LICENSE](LICENSE)