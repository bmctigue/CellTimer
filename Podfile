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
