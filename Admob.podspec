

Pod::Spec.new do |s|

  s.name         = "Admob"
  s.version      = "0.0.1"
  s.summary      = "FCX's Admob."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
                    Admob of FCX
                   DESC

  s.homepage     = "https://github.com/fengchuanx/Admob"
  s.license      = "MIT"
  s.author             = { "fengchuanx" => "fengchuanxiangapp@126.com" }

  s.source       = { :git => "https://github.com/fengchuanx/Admob.git", :tag => "0.0.1" }
  s.platform     = :ios, "8.0"

  s.source_files  = "*.{h,m}"

  s.vendored_frameworks = "GoogleMobileAds.framework"

  s.frameworks  = "AdSupport", "AudioToolbox", "AVFoundation", "CoreGraphics", "CoreTelephony", "EventKit", "EventKitUI", "MediaPlayer", "MessageUI", "StoreKit", "SystemConfiguration"

end
