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
public typealias ShadowColor = ColorDescribable

/// A convenient color setup with traditional RGBA values.
///
/// Call `ShadowRGBAColor.init(r:g:b:a:)` if encountering auto-completion failure.
public typealias ShadowRGBAColor = RGBAColor

/// A convenient color setup with hex value.
///
/// Call `ShadowRGBAColor.init(hex:alpha:)` if encountering auto-completion failure.
public typealias ShadowHexColor = HexColor
