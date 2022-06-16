#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint mnc_identifier_face.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'mnc_identifier_face'
  s.version          = '0.0.2'
  s.summary          = 'MNC liveness detection flutter plugin'
  s.description      = <<-DESC
A new Flutter plugin project.
                       DESC
  s.homepage         = 'https://github.com/mncinnovation/mnc_identifier_face'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Ahmad Ruslan' => 'ahmad.ruslan@mncgroup.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  s.dependency 'MNCIdentifier/Face', '1.0.2'
  s.dependency 'GoogleMLKit/FaceDetection', '2.3.0'

  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
