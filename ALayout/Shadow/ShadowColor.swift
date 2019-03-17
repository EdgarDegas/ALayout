//
//  ShadowColor.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/17.
//  Copyright © 2019 iMoe. All rights reserved.
//

public protocol ShadowColor {
    var uiColor: UIColor { get }
}

public struct ShadowRGBAColor: ShadowColor {
    var r: CGFloat
    var g: CGFloat
    var b: CGFloat
    var a: CGFloat
    
    public var uiColor: UIColor {
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}

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
    public var uiColor: UIColor { return self }
}
