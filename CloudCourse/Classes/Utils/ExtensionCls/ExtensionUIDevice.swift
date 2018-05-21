//
//  ExtensionUIDevice.swift
//  CloudCourse
//
//  Created by FSAnonymous on 21/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
extension UIDevice {
    
    open class func isPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812.0 {
            return true
        }
        return false
    }
    
    open class func navBarHeight() -> CGFloat {
        if self.isPhoneX() {
            return 88.0
        }
        return 64.0
    }
    
    open class func navBarOffset() -> CGFloat {
        if self.isPhoneX() {
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
        if self.isPhoneX() {
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
}
