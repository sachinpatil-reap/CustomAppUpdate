
# CustomAppUpdate

[![CI Status](https://img.shields.io/travis/sachinpatil-reap/CustomAppUpdate.svg?style=flat)](https://travis-ci.org/sachinpatil-reap/CustomAppUpdate)
[![Version](https://img.shields.io/cocoapods/v/CustomAppUpdate.svg?style=flat)](https://cocoapods.org/pods/CustomAppUpdate)
[![License](https://img.shields.io/cocoapods/l/CustomAppUpdate.svg?style=flat)](https://cocoapods.org/pods/CustomAppUpdate)
[![Platform](https://img.shields.io/cocoapods/p/CustomAppUpdate.svg?style=flat)](https://cocoapods.org/pods/CustomAppUpdate)

## Example

To run the example project, clone the repo, and run `pod 'CustomAppUpdate', :git => 'https://github.com/sachinpatil-reap/CustomAppUpdate.git'` from the Example directory first.

## Requirements

## Installation

Simply add the following lines to your Podfile:

Add CocoaPods specification source which is below ios platform in podfile
```ruby
source 'https://github.com/CocoaPods/Specs.git'
```

CustomAppUpdate is available through [CocoaPods](https://cocoapods.org). To install
```ruby
pod 'CustomAppUpdate', :git => 'https://github.com/sachinpatil-reap/CustomAppUpdate.git'
```

Steps to integrate the socket in your code :

Step 1: 
```swift
import CustomAppUpdate
```

Step 2: 
Initialise AppUpdater setup and set key parameters.for Custom pop up asset just add image name and for force update just setup true value as Boolean.
```swift
if AppUpdater.isUpdateAvailable(){
            AppUpdater.showUpdateAlert(nav: self.navigationController ?? UINavigationController(), isForceBool: false,asset: "{Add-Image-Name for Custom otherwise Empty value}")
        }
```

## Author

sachinpatil-reap, “p.sachin@reapmind.com”

## License

CustomAppUpdate is available under the MIT license. See the LICENSE file for more info.


