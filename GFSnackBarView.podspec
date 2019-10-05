#
# Be sure to run `pod lib lint GFSnackBarView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GFSnackBarView'
  s.version          = '0.1.1'
  s.summary          = 'Simple and customizable Snackbar.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Simple and customizable Snackbar. You can use it to show message, message with error, with loading or to confirm.
                       DESC

  s.homepage         = 'https://github.com/guidosette/GFSnackBarView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'guidosette' => 'guido.fanfani7@gmail.com' }
  s.source           = { :git => 'https://github.com/guidosette/GFSnackBarView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'GFSnackBarView/Classes/**/*'
  
   s.resource_bundles = {
     'GFSnackBarView' => ['GFSnackBarView/Assets/*.xib']
   }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
