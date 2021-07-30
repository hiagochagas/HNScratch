# HNScratch

HNScratch is an ObjectiveC framework that makes it easier to make scratchable views and it works both in ObjectiveC or Swift projects.

## Example

![](https://github.com/hiagochagas/HNScratch/blob/main/example.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* iOS 14.5+
* Swift 5 or Objective-C

## Installation

HNScratch is available through [CocoaPods](https://cocoapods.org). To install
it you can run the following line on terminal:

```ruby
sudo gem install cocoapods
```

After that, you will need a Podfile in your project. Go to your project directory and run:

```ruby
pod init
```
Add HNScratch to your project dependencies by simply adding the following line to your Podfile:

```ruby
pod 'HNScratch'
```
At last, run:

```ruby
pod install
```


## How to use

**Important things**
- ```HNScratch``` is the class that you are going to use 
- ```backgroundImage``` is the ```UIImage``` that you want to show when you scratch the view
- ```scratchableImage``` is the ```UIImage``` that you want to be scratched
- ```lineWidth``` is the ```CGFloat``` size of the scratch


**Creating instances**

* Swift

```swift
let scratch = HNScratch(imagesAndWidth: backgroundImage, scratch: scratchableImage, lineWidth: lineWidth)
```

* Objective-C

```objc
HNScratch *scratch = [HNScratch.new initWithImagesAndWidth:backgroundImage  scratchImage:scratchableImage lineWidth: lineWidth];
```


**Setting-up the scratchView**

* Swift
```swift
let scratchView = scratch?.getScratch()
```

* Objective-C

```objc
UIView *scratchView = [scratch getScratch];
```

Now you can use the ```scratchView``` as you want. 


## Authors

* **Hiago Chagas** - [hiagochagas](https://github.com/hiagochagas) 
* **Nathália Moura** - [nathaliacm](https://github.com/nathaliacm)

## License

HNScratch is available under the MIT license. See the LICENSE file for more info.
