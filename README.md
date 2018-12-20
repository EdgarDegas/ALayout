# ALayout [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

A dynamic framework that allows you to easily add shadows to a UIView instance, using the same shadow paramters in [Sketch](www.sketchapp.com).

Compatible with Swift 4.2 + and iOS 12.0 +.



## Getting Started

### Prerequisites

Make sure you have Carthage installed. Otherwise, simply install with Homebrew:

```bash
brew install carthage
```

### Include it to your iOS Project

1. At the directory of your `.xcodeproj` or `.xcworkspace` file, create a file named `Cartfile`. Open the file using your text editor, add one line:

```
github "EdgarDegas/ALayout"
```

2. At the same directory, execute this line into your Terminal:

```
carthage update
```

3. When `update` is done, a new folder `Carthage` is created. Get into  `Carthage/Build/iOS`, find  `ALayout.framework`.
4. Open your xcode project, drag the `ALayout.framework` file into `Linked Frameworks and Libraries`.



## Quick tutorial

### Add shadows to UIView

What it looks like:

![Add shadow to a floating card](assets/demo.jpeg)

Code:

```swift
import ALayout

class YourViewController: UIViewController {
    // ...
    
    floatingCardView.add(shadow: Shadow(color: #colorLiteral(red: 0.6745098039, green: 0.8156862745, blue: 0.9921568627, alpha: 1), opacity: 0.12, dx: 0, dy: 6, blur: 16, spread: -6))
    floatingCardView.add(shadow: Shadow(color: #colorLiteral(red: 0.6745098039, green: 0.8156862745, blue: 0.9921568627, alpha: 1), opacity: 0.08, dx: 0, dy: 2, blur: 42, spread: -6))
    
    // ...
}
```





1. You first need to initialize a  `Shadow` object:

```swift
let shadow = Shadow(color: opacity: dx: dy: blur: spread)
```

The parameters are basically the same with those in Sketch. In case you are not familiar with UI design:

* color: `UIColor`
* opacity: `CGFloat`, ranging from 0.0 (transparent) to 1.0 (opaque)
* dx: `CGFloat`, offset on x-axis, negative (leftward) or positive (rightward)
* dy: `CGFloat`, offset on x-axis, negative (upward) or positive (downward)
* blur: `CGFloat`, the blur radius of shadow, positive value
* spread: `CGFloat`, increase or decrese the size of shadow from the size of your view



2. Then add it to your `UIView` instance: 

```swift
view.add(shadow)
```



3. You can add multiple shadows to one view.



### Add Gradient Background Color to UIView

One line handles this:

```swift
someView.addGradientLayer(gradientLayer: myGradientLayer)
```

Currently you need to create `myGradientLayer` (a `CAGradientLayer` instance) by yourself.