#
# Be sure to run `pod lib lint RxMatrixSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxMatrixSDK'
  s.version          = '0.1.0'
  s.summary          = 'Unoficial matrix.org swift SDK with reactive architecture'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Unoficial matrix.org swift SDK with reactive architecture'

  s.homepage         = 'https://github.com/rezacute/rx-matrix-swift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'rezacute' => 'riza.alaudin@kii.com' }
  s.source           = { :git => 'https://github.com/rezacute/rx-matrix-swift.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'RxMatrixSDK/Classes/**/*'

  s.default_subspec = "Core"

  s.subspec "Core" do |ss|
    ss.source_files  = 'RxMatrixSDK/Classes/*.swift'
    ss.dependency "RxAlamofire"
    ss.framework  = "Foundation"
  end

  # s.resource_bundles = {
  #   'RxMatrixSDK' => ['RxMatrixSDK/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
