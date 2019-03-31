//
//  Gradient.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import Foundation

public typealias GradientColor = (color: ColorDescribable, position: Point)

public struct Gradient {
    var beginColor: GradientColor
    var endColor: GradientColor
    var middleColors: Array<GradientColor>
}
