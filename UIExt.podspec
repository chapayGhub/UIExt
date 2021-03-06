#
# Be sure to run `pod lib lint UIExt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIExt'
  s.version          = '1.0.1'
  s.summary          = 'swift extensions and helpers for ui classes'

  s.description      = <<-DESC
swift helpers and extensions for ui classes
                       DESC

  s.homepage              = 'https://github.com/chapayGhub/UIExt'
  s.license               = { :type => 'MIT', :file => 'LICENSE' }
  s.author                = 'chapayGhub'
  s.source                = { :git => 'https://github.com/chapayGhub/UIExt.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files          = 'UIExt/Classes/**/*'
  s.frameworks            = 'UIKit'  
end
