Pod::Spec.new do |spec|
  spec.name         = "SharedKeychainManager"
  spec.version      = "0.1.0"
  spec.summary      = "Shared Keychain space with other iOS applications"
  spec.description  = "Shared Keychain tool. You can share this Keychain space with other applications."
  spec.homepage     = "https://shuichi.tech/"

  spec.license      = "MIT"

  spec.author             = { "ngo275" => "ngo38114@gmail.com" }
  spec.social_media_url   = "https://twitter.com/@NGO275"

  spec.platform     = :ios
  # spec.platform     = :ios, "12.0"
  spec.swift_version  = "5.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "12.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"

  spec.source       = { :git => "https://github.com/ngo275/SharedKeychainManager.git", :tag => "#{spec.version}" }
  # spec.source_files  = "KeychainAccessor"
  spec.source_files  = 'SharedKeychainManager/*.{h,m,swift}'
  spec.exclude_files = "Classes/Exclude"

  # spec.public_header_files = "Classes/**/*.h"
  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"
  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  spec.dependency "KeychainAccess"

end
