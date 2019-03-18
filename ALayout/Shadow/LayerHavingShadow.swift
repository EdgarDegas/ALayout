//
//  LayerHavingShadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/19.
//  Copyright © 2019 iMoe. All rights reserved.
//

import UIKit

typealias LayerHavingShadow = HavingShadow & ShadowAnimatable

protocol ShadowAnimatable: class {
    func configureShadow(_ shadow: Shadow)
    func animate(into shadow: Shadow, completion: (() -> Void)?)
    
    func blurAnimation   (to blur   : CGFloat ) -> CABasicAnimation
    func opacityAnimation(to opacity: CGFloat ) -> CABasicAnimation
    func offsetAnimation (to offset : CGVector) -> CABasicAnimation
}
