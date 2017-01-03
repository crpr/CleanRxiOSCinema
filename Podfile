platform :ios, "8.0"

target 'CleanRxiOSCinema' do
  use_frameworks!

  plugin 'cocoapods-keys', {
    :project => "CleanRxiOSCinema",
    :keys => [
      "CinemaApiKey"
    ]}

  # Pods for Marvel
   pod 'SwiftGen'
   pod 'RxSwift'
   pod 'Moya-ObjectMapper', :git => 'https://github.com/ivanbruel/Moya-ObjectMapper'
   pod 'CryptoSwift'
   pod 'Dollar'
   pod 'Kingfisher'
   pod 'Reusable'
   pod 'XCGLogger', '~> 4.0.0'
   pod 'Moya', '8.0.0-beta.6'

  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '3.0'
      end
    end
  end
end
