//
//  GradientSettings.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

public struct GradientSettings {
    var colorStops: Array<GradientStop>
    
    var beginPoint: Point
    var endPoint  : Point
    
    var direction: GradientLinearDirection {
        didSet {
            let points = direction.points
            beginPoint = points.begin
            endPoint   = points.end
        }
    }
    
    init(begin: GradientStop, end: GradientStop) {
        self = GradientSettings(colorStops: [begin, end])
    }
    
    init(colorStops: Array<GradientStop>) {
        self.colorStops = colorStops
        direction = .vertical
        let points = direction.points
        beginPoint = points.begin
        endPoint   = points.end
    }
}
