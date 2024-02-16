platform :ios, '13.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'Pleny-Task' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Pleny-Task
    pod 'SDWebImageSwiftUI'
    pod 'SwiftGen'
    pod 'IQKeyboardManagerSwift'
    pod 'Alamofire'
    pod 'Moya'
    pod 'SwiftLint'


  target 'Pleny-TaskTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'Pleny-TaskUITests' do
    # Pods for testing
  end
  post_install do |installer|
    installer.pods_project.targets.each do |target|
      target.build_configurations.each do |config|
      # some older pods don't support some architectures, anything over iOS 11 resolves that
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
      end
    end
  end
end
