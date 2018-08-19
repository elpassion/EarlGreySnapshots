Pod::Spec.new do |s|
  s.name             = 'EarlGreySnapshots'
  s.version          = '0.0.5'
  s.summary          = 'EarlGrey action for snapshot testing.'
  s.description      = <<-DESC
                       EarlGrey actions for FBSnapshotTestCase. Provides functional tests counterpart for [Nimble Snapshots](https://github.com/ashfurrow/Nimble-Snapshots).
                       DESC

  s.homepage         = 'https://github.com/elpassion/EarlGreySnapshots'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'turekj' => 'jkbturek@gmail.com' }
  s.source           = { :git => 'https://github.com/kelliespears/EarlGreySnapshots.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/KubaTurek'

  s.ios.deployment_target = '9.0'

  s.source_files = 'EarlGreySnapshots/Classes/**/*'
  s.frameworks = 'Foundation', 'XCTest'
  s.dependency 'EarlGrey', '~> 1.15.0'
  s.dependency 'iOSSnapshotTestCase', '~> 3.0'
end
