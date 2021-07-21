Pod::Spec.new do |s|
  s.name         = "SendBirdCalls"
  s.version      = "1.7.1"
  s.summary      = "real-time calls based on Sendbird Calls SDK"
  s.description  = "Sendbird Calls enables real-time calls between users registered within a Sendbird application"
  s.homepage     = "https://sendbird.com"
  s.documentation_url = 'https://sendbird.com/docs/calls'
  s.license      = "Commercial"
  s.authors      		 = { "Young Hwang" => "young.hwang@sendbird.com", "Minhyuk Kim" => "minhyuk.kim@sendbird.com", "Jaesung Lee" => "jaesung.lee@sendbird.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/sendbird/sendbird-calls-ios.git", :tag => "#{s.version}" }
  s.ios.vendored_frameworks = "SendBirdCalls.xcframework"
  s.ios.frameworks = ["UIKit", "Foundation", "PushKit", "WebRTC", "AVKit", "MediaPlayer", "Network", "CoreTelephony", "VideoToolbox"]
  s.requires_arc = true
  s.dependency "SendBirdWebRTC", "~> 1.3.0"
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
