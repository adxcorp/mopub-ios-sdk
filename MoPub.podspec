#
#  Be sure to run `pod spec lint MoPub.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|


  s.name         = "mopub-ios-sdk"
  s.module_name  = "MoPub"
  s.version      = "5.0.0.1"
  s.summary      = "ADX MoPub"

  s.description  = <<-DESC
  ADX MoPub
                   DESC

  s.homepage     = "http://EXAMPLE/MoPub"
  s.license      = "MIT (example)"
  s.author             = { "Eleanor Choi" => "khchoi@adxcorp.kr" }

  s.platform     = :ios, "8.0"
  s.source       = { :git => "ttps://github.com/adxcorp/mopub-ios-sdk", : commit => '5641d23' }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  s.requires_arc = true

  s.frameworks = "AVFoundation", 
                 "CoreGraphics",
                 "CoreLocation",
                 "CoreMedia",
                 "CoreTelephony",
                 "Foundation",
                 "MediaPlayer",
                 "QuartzCore",
                 "SystemConfiguration",
                 "UIKit",
                 "SafariServices"

  s.weak_frameworks = "AdSupport", 
                 		"StoreKit",
                 		"WebKit"
  s.default_subspecs = "MoPubSDK"

  s.subspec 'MoPubSDK' do |mopub|
    mopub.dependencies = "mopub-ios-sdk/Core", "mopub-ios-sdk/Core", "mopub-ios-sdk/Core"
  end

  s.subspec 'Core' do |core|
    core.source_files = "MoPubSDK/**/*.{h,m}"
    core.resources = "MoPubSDK/**/*.{png,bundle,xib,nib,html}"
    core.exclude_files =  "MoPubSDK/Viewability/Moat",
    						"MoPubSDK/Viewability/Avid"
  end
  
  s.subspec 'Avid' do |avid|
    avid.dependencies = "mopub-ios-sdk/Core"
    avid.source_files = "MoPubSDK/Viewability/Avid/*.{h,m}"
    avid.vendored_libraries = "MoPubSDK/Viewability/Avid/*.{a}"
  end

  s.subspec 'Moat' do |moat|
    avid.dependencies = "mopub-ios-sdk/Core"
    avid.vendored_frameworks = "MoPubSDK/Viewability/Moat/MPUBMoatMobileAppKit.framework"
    avid.source_files = "MoPubSDK/Viewability/MOAT/*.{h,m}"
  end


end
