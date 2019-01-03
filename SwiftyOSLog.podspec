Pod::Spec.new do |s|
  s.name         = "SwiftyOSLog"
  s.version      = "1.0"
  s.summary      = "A lightweight and easy to use wrapper on top of os_log."
  s.homepage     = "https://github.com/NikolaySohryakov/SwiftyOSLog"
  
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "Nikolay Sokhryakov" => "Nikolay.Sohryakov@gmail.com" }
  s.social_media_url   = "http://twitter.com/nsohryakov"
  
  s.ios.deployment_target = "10.0"

  s.source       = { :git => "https://github.com/NikolaySohryakov/SwiftyOSLog.git", :tag => "#{s.version}" }

  s.source_files  = "SwiftyOSLog/**/*.{swift}"

  s.requires_arc = true
  
  s.swift_version = "4.2"
end
