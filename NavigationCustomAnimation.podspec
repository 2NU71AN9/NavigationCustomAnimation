Pod::Spec.new do |spec|

  spec.name         = "NavigationCustomAnimation"
  spec.version      = "0.0.1"
  spec.swift_version  = "5.0"
  spec.summary      = "自定义转场动画"
  spec.description  = "导航视图自定义转场动画"
  spec.homepage     = "https://github.com/2NU71AN9/NavigationCustomAnimation"
  spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  spec.author             = { "sunLiang" => "1491859758@qq.com" }
  spec.platform     = :ios, "9.0"
  spec.source       = { :git => "https://github.com/2NU71AN9/NavigationCustomAnimation.git", :tag => "#{spec.version}" }
  spec.source_files = "NavigationCustomAnimation/Framework/*.{h,m,swift}"
  spec.requires_arc = true #是否支持ARC
end
