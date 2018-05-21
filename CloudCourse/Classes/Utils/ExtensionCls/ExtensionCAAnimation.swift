//
//  ExtensionCAAnimation.swift
//  CloudCourse
//
//  Created by FSAnonymous on 19/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

extension CAAnimation {
    
    open class func tabBarClickAnimation(at index: Int, buttons:[Any]) {
        let animation = CABasicAnimation(keyPath: "transform.scale")
        animation.duration = 0.2;
        animation.repeatCount = 1;
        animation.fromValue = 0.1;
        animation.toValue = 1;
        (buttons[index] as AnyObject).layer.add(animation, forKey: nil)
    }
    
    open class func tabBarItemAnimation(at index: Int, tabBarIndicator: UIView, tabBar: UITabBar, color: [UIColor]) {
        UIView.animate(withDuration: 0.2, animations: {
        tabBarIndicator.frame.origin.x = CGFloat(index) * tabBar.bounds.width / (CGFloat((tabBar.items?.count)!))
        var colorIndex = index
        if colorIndex > 2 { colorIndex = 0 }
        tabBarIndicator.backgroundColor = color[colorIndex]
        })
    }
}
