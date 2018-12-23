//
//  ShadowView.swift
//  ALayout
//
//  Created by 孙一萌 on 2018/12/21.
//  Copyright © 2018 iMoe. All rights reserved.
//

import UIKit

open class ALView: UIView {
    public var shadowLayers = Array<ShadowLayer>()
    
    internal typealias ShadowLayoutHandlers = () -> Void
    internal var needsLayoutShadowHandlers = Array<ShadowLayoutHandlers>()
}
