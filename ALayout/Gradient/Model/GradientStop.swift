//
//  GradientStop.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

struct GradientStop {
    var color: ColorDescribable
    var point: Point
    
    var cgPoint: CGPoint { return .init(x: point.x, y: point.y) }
}
