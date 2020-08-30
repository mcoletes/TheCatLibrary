platform :ios, '13.0'
use_frameworks!


def testingPods
  pod 'iOSSnapshotTestCase'
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
  end
  
  target 'TheCatsLibrarySnapshotTests' do
    inherit! :search_paths
    # Pods for testing
  testingPods
  end

  target 'TheCatsLibraryUITests' do
    # Pods for testing
  end

end
