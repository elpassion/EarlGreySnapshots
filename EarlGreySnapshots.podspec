Pod::Spec.new do |s|
  s.name             = 'EarlGreySnapshots'
  s.version          = '0.1.0'
  s.summary          = 'EarlGrey action for snapshot testing.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/turekj/EarlGreySnapshots'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'turekj' => 'jakub.turek@elpassion.pl' }
  s.source           = { :git => 'https://github.com/turekj/EarlGreySnapshots.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KubaTurek'

  s.ios.deployment_target = '9.0'

  s.source_files = 'EarlGreySnapshots/Classes/**/*'
  s.frameworks = 'Foundation', 'XCTest'
  s.dependency 'EarlGrey', '~> 1.9'
  s.dependency 'FBSnapshotTestCase', '~> 2.1'
end
