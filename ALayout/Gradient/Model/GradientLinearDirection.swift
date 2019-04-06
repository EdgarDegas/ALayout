//
//  GradientLinearDirection.swift
//  CarthageDemo
//
//  Created by 孙一萌 on 2019/4/6.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit


/// The linear direction style of gradient colors.
public enum GradientLinearDirection {
    /// Graduate from top to bottom.
    case vertical
    
    /// Graduate from left to right.
    case horizontal
    
    /// Graduate from top-left to bottom-right.
    case diagonal
    
    /// Customized gradient direction determined by two points.
    ///
    /// The color graduates from *begin* to *end*.
    /// - Note:
    ///     The two points use the same coordinate system as CALayer, see the `position`
    ///     property of CALayer for detail.
    ///
    ///     The coordinates of the points inside the layer vary from (0, 0) to (1, 1).
    ///     But you can specify the begin or end point with a point, either of whose coordinate
    ///     outside of that range (from 0 to 1).
    ///     The behaviour remains the same with Sketch.app, and of course with CAGradientLayer's
    ///     startPoint and endPoint.
    case custom(begin: Point, end: Point)
}
