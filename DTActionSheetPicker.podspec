#
# Be sure to run `pod lib lint DTActionSheetPicker.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "DTActionSheetPicker"
  s.version          = "0.1.0"
  s.summary          = "Date Time Picker with block."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library is to create a ActionSheet with an array of NSDate.
                       DESC

  s.homepage         = "https://github.com/<GITHUB_USERNAME>/DTActionSheetPicker"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Yeung Yiu Hung" => "yeungyiuhung@cherrypicks.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/DTActionSheetPicker.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'DTActionSheetPicker/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DTActionSheetPicker' => ['DTActionSheetPicker/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
