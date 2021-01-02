#
# Be sure to run `pod lib lint SwiftAlgorithm.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftAlgorithm'
  s.version          = '0.1.0'
  s.summary          = 'Swift Algorithm'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Swift Algorithm'

  s.homepage         = 'https://github.com/dukim-go/SwiftAlgorithm'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dukim-go' => 'dukim.dev@gmail.com' }
  s.source           = { :git => 'https://github.com/dukim-go/SwiftAlgorithm.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  # s.platform = :osx
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"

  s.source_files = 'SwiftAlgorithm/Classes/**/*'

  # s.resource_bundles = {
  #   'SwiftAlgorithm' => ['SwiftAlgorithm/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'Cocoa'
  # s.dependency 'AFNetworking', '~> 2.3'

  s.xcconfig = { "ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES" => "$(inherited)" }
  s.pod_target_xcconfig = { "APPLICATION_EXTENSION_API_ONLY" => "YES" }

  s.test_spec 'UnitTests' do |test_spec|
    # test_spec.requires_app_host = true
    test_spec.test_type = :unit
    # test_spec.test_type = :ui
    test_spec.source_files = "Tests/UnitTests/**/*.{swift}"
    test_spec.pod_target_xcconfig = { "APPLICATION_EXTENSION_API_ONLY" => "$(inherited)" }
  end 
end
