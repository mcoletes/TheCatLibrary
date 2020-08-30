# TheCatLibrary
The cats library is a master detail app that shows the cats available at https://thecatapi.com/ and the details of it.

### Demo
![Alt Text](/App-presentaion.gif)

## Prerequisites
* [Xcode](https://developer.apple.com/xcode/) 11.6
* [Cocoapods](https://cocoapods.org) 1.9.1 (only if you want to update the Pods, they are already inside the project).

## Architecture
### List of Cats
* The list feature was developed using [clean swift architecture](https://clean-swift.com/).
### Cat Detail
*  The detail feature was developed using Reactive MVVM with a simple binding class do perform reactiveness between view model and view controller.

## Tests
* Snapshot Tests - [iOSSnapshotTestCase (previously FBSnapshotTestCase)](https://github.com/uber/ios-snapshot-test-case)
* Unit Tests - [XCTest](https://developer.apple.com/documentation/xctest)
### SnapshotTests
* Used simulator iPhone SE (2nd generation) to record the snapshots. Use it when running the tests.

