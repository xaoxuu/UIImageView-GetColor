#
# Be sure to run `pod lib lint ATPalette.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ATPalette'
  s.version          = '0.0.1'
  s.summary          = 'RGB palette for iOS get color from UIImageView.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  RGB palette for iOS get color from UIImageView 可以从指定点获取颜色. 示例是一个默认的取色板.
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/AesirTitan/ATPalette'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'AesirTitan' => 'ayan.bifrost@gmail.com' }
  s.source           = { :git => 'https://github.com/AesirTitan/ATPalette.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'ATPalette/Classes/**/*'

  s.resource_bundles = {
    'ATPalette' => ['ATPalette/Assets/*.png']
  }

  s.public_header_files = 'ATPalette/Classes/UIImageView+GetColorAtPixel.h'
  s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
