//
//  ShadowColor.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/17.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

/// Convenient color setups.
///
/// Conformed by ShadowRGBAColor, ShadowHexColor and UIColor.
public protocol ShadowColor {
    /// The corresponding UIColor instance.
    var uiColor: UIColor { get }
    
    /// The corresponding CGColor instance.
    var cgColor: CGColor { get }
}

public extension ShadowColor {
    var cgColor: CGColor { return uiColor.cgColor }
}

/// A convenient color setup with traditional RGBA values.
///
/// Call `ShadowRGBAColor.init(r:g:b:a:)` if encountering auto-completion failure.
public struct ShadowRGBAColor: ShadowColor {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
    
    public var uiColor: UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

/// A convenient color setup with hex value.
///
/// Call `ShadowRGBAColor.init(hex:alpha:)` if encountering auto-completion failure.
public struct ShadowHexColor: ShadowColor {
    var hex: Int
    var alpha: CGFloat
    
    public var uiColor: UIColor {
        let r: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g: CGFloat = CGFloat((hex & 0x00FF00) >>  8) / 255.0
        let b: CGFloat = CGFloat (hex & 0x0000FF)        / 255.0
        let a = alpha
        return .init(red: r, green: g, blue: b, alpha: a)
    }
}

extension UIColor: ShadowColor {
    /// Required by `ShadowColor` protocol. This value returns itself.
    public var uiColor: UIColor { return self }
}
