platform :ios, '13.0'
use_frameworks!


def unitTestingPods
    pod 'Quick'
    pod 'Nimble'
    pod 'Nimble-Snapshots'
end

def visualPods
    pod 'SDWebImage'
end


target 'TheCatsLibrary' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
	visualPods
  # Pods for TheCatsLibrary

  target 'TheCatsLibraryTests' do
    inherit! :search_paths
    # Pods for testing
	unitTestingPods
  end

  target 'TheCatsLibraryUITests' do
    # Pods for testing
  end

end
