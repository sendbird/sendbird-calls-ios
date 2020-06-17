Pod::Spec.new do |s|
  s.name         = "SendBirdCalls"
  s.version      = "1.1.3"
  s.summary      = "real-time calls based on SendBird SDK"
  s.description  = "SendBirdCalls enables real-time calls between users registered within a SendBird application"
  s.homepage     = "https://sendbird.com"
  s.documentation_url = 'https://docs.sendbird.com/ios'
  s.license      = "Commercial"
  s.authors      		 = { "Young Hwang" => "young.hwang@sendbird.com", "Minhyuk Kim" => "minhyuk.kim@sendbird.com", "Jaesung Lee" => "jaesung.lee@sendbird.com", "Damon Park" => "damon.park@sendbird.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/sendbird/sendbird-calls-ios.git", :tag => "#{s.version}" }
  s.ios.vendored_frameworks = "SendBirdCalls.framework"
  s.ios.frameworks = ["UIKit", "Foundation", "PushKit", "WebRTC", "AVKit", "MediaPlayer", "Network", "CoreTelephony"]
  s.requires_arc = true
  s.dependency "SendBirdWebRTC"
end
