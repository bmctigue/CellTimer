source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

def shared_pods
  pod 'Unbox'
  pod 'Promis'
  pod 'Tiguer', :git => 'https://github.com/bmctigue/Tiguer.git'
  pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
  pod 'DifferenceKit'
end

target 'CellTimer' do
    shared_pods
end

target 'CellTimerTests' do
  inherit! :search_paths
  shared_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      configuration.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      configuration.build_settings['SWIFT_EXEC'] = '$(SRCROOT)/SWIFT_EXEC-no-coverage'
    end
  end
end
