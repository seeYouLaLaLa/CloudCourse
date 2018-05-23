//
//  KRect.swift
//  CloudCourse
//
//  Created by FSAnonymous on 21/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class KRect: NSObject {
    
    open class func navBarHeight() -> CGFloat {
        if isPhoneX() {
            return 88.0
        }
        return 64.0
    }
    
    open class func navBarOffset() -> CGFloat {
        if isPhoneX() {
            return 24.0
        }
        return 0.0
    }
    
    open class func tabBarOffset() -> CGFloat {
        if isPhoneX() {
            return 34.0
        }
        return 0.0
    }
    
    open class func tabBarHeight() -> CGFloat {
        if isPhoneX() {
            return 83.0
        }
        return 49.0
    }
    
    open class func screenHeight() -> CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    open class func screenWidth() ->  CGFloat {
        return UIScreen.main.bounds.size.width
    }
    
    open class func navBarRect()-> CGRect {
        return CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: screenWidth(), height: navBarHeight())
    }
    
    open class func pageInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
    
    open class func navgationItemInset() -> UIEdgeInsets {
        return UIEdgeInsets(top: UIEdgeInsets.zero.top, left: 14, bottom: UIEdgeInsets.zero.bottom, right: 14)
    }
    
    open class func visibleInNavTabRect() -> CGRect {
        return CGRect(x: CGPoint.zero.x, y: self.navBarHeight(), width: screenWidth(), height: screenHeight() - navBarHeight() - tabBarHeight())
    }
    
    open class func visibleNoTabRect() -> CGRect {
        return CGRect(x: CGPoint.zero.x, y: self.navBarHeight(), width: screenWidth(), height: screenHeight() - navBarHeight())
    }
    
    open class func visibleNoNavRect() -> CGRect {
        return CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: screenWidth(), height: screenHeight() - tabBarHeight())
    }
    
    open class func visibleNoNavTabRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    
    open class func isPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812.0 {
            return true
        }
        return false
    }
}
