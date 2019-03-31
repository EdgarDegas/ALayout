//
//  GradientSettings.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/31.
//  Copyright © 2019 iMoe. All rights reserved.
//

import Foundation

public struct GradientSettings {
    var beginStop: GradientStop
    var endStop  : GradientStop
    var middleColors: Array<GradientStop>
    
    init(begin: GradientStop, end: GradientStop) {
        beginStop = begin
        endStop   = end
        self.middleColors = .init()
    }
    
    var allStops: Array<GradientStop> {
        return [beginStop] + middleColors + [endStop]
    }
}
