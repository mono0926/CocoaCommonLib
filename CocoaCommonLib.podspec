#
# Be sure to run `pod spec lint CocoaCommonLib.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.platform     = :ios, '7.0'
  s.name         = "CocoaCommonLib"
  s.version      = "0.0.1"
  s.summary      = "A short description of CocoaCommonLib."
  s.homepage     = "https://github.com/mono0926/CocoaCommonLib"
  s.license      = 'MIT'
  s.author       = { "Masayuki Ono" => "mono0926@gmail.com" }
  s.source       = { :git => "https://github.com/mono0926/CocoaCommonLib.git", :tag => "#{s.version.to_s}" }
  s.source_files = 'CocoaCommonLib', 'CocoaCommonLib/**/*.{h,m}'
  # s.exclude_files = 'Classes/Exclude'
  s.requires_arc = true
  s.dependency 'MKNetworkKit'
  s.dependency 'BlocksKit'
  s.dependency 'RestKit'
  s.dependency 'Syringe'
  s.dependency 'CocoaLumberjack'
end
