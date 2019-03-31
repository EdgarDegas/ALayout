//
//  UIView+GradientLayer.swift
//  aCount
//
//  Created by 孙一萌 on 2018/11/24.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

/// An object that contains of shadow parameters.
///
/// You can set shadow for a UIView instance. See `set(shadow:)`
/// of `UIView` for detail.
///
/// You can initialize a Shadow object using the same parameters from
/// your app's design.
public struct Shadow {
    
    /// Color of the shadow.
    public var color: ShadowColor = UIColor.black
    
    /// The shadow's (x, y) offset. Defaults to (0, 0).
    ///
    /// A positive value means rightwards on x-axis and downwards on y-axis.
    public var offset: Offset = (dx: 0, dy: 0)
    
    /// Shadow opacity. Defaults to 0.
    public var opacity: CGFloat  = 0
    
    /// Shadow's spreading size.
    ///
    /// You might be familiar with this property if you use Sketch often.
    /// If not, this might be unnecessary for you.
    ///
    /// Setting a spread as 5 means the shadow path has (-5) insets on all four edges of
    /// the layer.
    ///
    /// Anyway, larger the `spread`, larger the shadow is than the layer itself.
    /// And this value can be negative.
    public var spread: CGFloat  = 0
    
    /// Shadow blur radius.
    public var blur: CGFloat  = 0
    
    /// Initialize a Shadow object with default shadow parameters.
    public init() { }
    
    /// Initialize a Shadow object with the same parameters from your app's design.
    /// - Parameters:
    ///     - color: Color of the shadow. ShadowColor is a convenience setup for the basic
    ///              UIColor and CGColor object. You can specify UIColor, ShadowRGBAColor
    ///              or ShadowHexColor for this parameter.
    ///     - opacity: Shadow opacity. Defaults to 0.
    ///     - offset: Shadow offset. A positive value means rightwards on x-axis and downwards on y-axis.
    ///     - blur: Shadow's blur radius.
    ///     - spread: You might be familiar with this property if you use Sketch often.
    ///               If not, this might be unnecessary for you. See `spread` for detail.
    public init(color: ShadowColor, opacity: CGFloat, offset: Offset, blur: CGFloat, spread: CGFloat) {
        self.color   = color
        self.opacity = opacity
        self.spread  = spread
        self.blur    = blur
        self.offset  = offset
    }
    
    /// Initialize a Shadow object with the same parameters from your app's design.
    /// - Parameters:
    ///     - color: Color of the shadow. ShadowColor is a convenience setup for the basic
    ///              UIColor and CGColor object. You can specify UIColor, ShadowRGBAColor
    ///              or ShadowHexColor for this parameter.
    ///     - opacity: Shadow opacity. Defaults to 0.
    ///     - offset: Shadow offset. A positive value means rightwards on x-axis and downwards on y-axis.
    ///     - blur: Shadow's blur radius.
    public init(color: ShadowColor, opacity: CGFloat, offset: Offset, blur: CGFloat) {
        self.init(color: color, opacity: opacity, offset: offset, blur: blur, spread: 0)
    }
}
