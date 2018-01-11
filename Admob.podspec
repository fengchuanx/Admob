

Pod::Spec.new do |s|

  s.name         = "Admob"
  s.version      = "0.0.1"
  s.summary      = "FCX's Admob."
  s.description  = <<-DESC
                    Admob of FCX
                   DESC
  s.homepage     = "https://github.com/fengchuanx/Admob"
  s.license      = "MIT"
  s.author             = { "fengchuanx" => "fengchuanxiangapp@126.com" }
  s.source       = { :git => "https://github.com/fengchuanx/Admob.git", :tag => "0.0.1" }
  s.platform     = :ios, "8.0"
  s.source_files  = "*.{h,m}"

  s.dependency "Google-Mobile-Ads-SDK"

end
