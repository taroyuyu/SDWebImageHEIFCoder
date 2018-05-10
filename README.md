# SDWebImageHEIFCoder

[![CI Status](https://img.shields.io/travis/DreamPiggy/SDWebImageHEIFCoder.svg?style=flat)](https://travis-ci.org/DreamPiggy/SDWebImageHEIFCoder)
[![Version](https://img.shields.io/cocoapods/v/SDWebImageHEIFCoder.svg?style=flat)](https://cocoapods.org/pods/SDWebImageHEIFCoder)
[![License](https://img.shields.io/cocoapods/l/SDWebImageHEIFCoder.svg?style=flat)](https://cocoapods.org/pods/SDWebImageHEIFCoder)
[![Platform](https://img.shields.io/cocoapods/p/SDWebImageHEIFCoder.svg?style=flat)](https://cocoapods.org/pods/SDWebImageHEIFCoder)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

This is a [SDWebImage](https://github.com/rs/SDWebImage) coder plugin to add [High Efficiency Image File Format (HEIF)](http://nokiatech.github.io/heif/index.html) support. Which is built based on the open-sourced [libheif](https://github.com/strukturag/libheif) codec.

This HEIF coder plugin currently support HEIF single/still image **decoding** as well as HEIC image **encoding**.

It support iOS 8+/macOS 10.10+ device without the dependency of Apple's Image/IO framework.

However, for better performance and hardware accelerate for iOS 11+ device, it's really recommended to use Image/IO instead.

## Requirements

+ iOS 8
+ tvOS 9.0
+ macOS 10.10

## Installation

SDWebImageHEIFCoder is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDWebImageHEIFCoder'
```

SDWebImageHEIFCoder contains 2 subspec `libde265` & `libx265`. Which integrate the codec plugin for libheif to support HEIF image decoding/encoding.

To enable HEIF decoding, you should add `libde265` subspec:

```ruby
pod 'SDWebImageHEIFCoder/libde265'
```

To enable HEIF encoding, you should add `libx265` subspec:

```ruby
pod 'SDWebImageHEIFCoder/libx265'
```

By default will contains all subspec.

## Usage

```objective-c
SDWebImageAPNGCoder *HEIFCoder = [SDWebImageHEIFCoder sharedCoder];
[[SDImageCodersManager sharedInstance] addCoder:HEIFCoder];
UIImageView *imageView;
NSURL *HEIFURL;
[imageView sd_setImageWithURL:HEIFURL];
```

## 4.x compatibility

SDWebImage 5.x change the custom image coder API. This `master` branch follow the `5.x` branch of SDWebImage. For 4.x compatibility HEIF coder support, checkout `4.x` branch.

## Screenshot

<img src="https://raw.githubusercontent.com/dreampiggy/SDWebImageHEIFCoder/master/Example/Screenshot/HEIFDemo.png" width="300" />

The images are from [HEIF official site example](http://nokiatech.github.io/heif/examples.html)

## Author

DreamPiggy, lizhuoli1126@126.com

## License

SDWebImageHEIFCoder itself is available under the MIT license. See the LICENSE file for more info.
However, when using `libde265`, the license will be subject to LGPL licence. When using `libx265`, the license will be subject to GPL licence (or commercial licence if you have one)

## Thanks

+ [libheif](https://github.com/strukturag/libheif)
+ [libde265](https://github.com/strukturag/libde265)
+ [libx265](https://bitbucket.org/multicoreware/x265)


