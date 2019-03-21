//
//  HavingShadow.swift
//  ALayout
//
//  Created by 孙一萌 on 2019/3/17.
//  Copyright © 2019 iMoe. All rights reserved.
//

public protocol HavingShadow {
    func set(shadow: Shadow, animated: Bool, completion: (() -> Void)?)
    func removeShadow(animated: Bool, completion: (() -> Void)?)
}
