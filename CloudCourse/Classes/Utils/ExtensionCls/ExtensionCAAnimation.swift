//
//  ExtensionCAAnimation.swift
//  CloudCourse
//
//  Created by FSAnonymous on 19/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

extension CAAnimation {
    open class func tabBarClickAnimation(at index: Int,tabBar: UITabBar) {
        var buttons = [Any]()
        for tabBarBtn in tabBar.subviews {
            if tabBarBtn.isKind(of: NSClassFromString("UITabBarButton")!) {
                buttons.append(tabBarBtn)
            }
        }
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.1;
        animation.repeatCount = 1;
        animation.fromValue = 0.1;
        animation.toValue = 1;
        (buttons[index] as AnyObject).layer.add(animation, forKey: nil)
    }
}
