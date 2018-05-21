//
//  ExtensionColor.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
extension UIColor {
    static let CGFloat255 = CGFloat(255)
    
    open class func main() -> UIColor {
        return UIColor.orange
    }
    
    open class func kGreen() -> UIColor {
        return rgb(red: 50, green: 180, blue: 60)
    }
    
    open class func kBlack() -> UIColor {
        return rgb(red: 51, green: 51, blue: 51)
    }
    
    open class func kGray() -> UIColor {
        return rgb(red: 140, green: 140, blue: 140)
    }
    
    open class func kLightGray() -> UIColor {
        return rgb(red: 240, green: 240, blue: 240)
    }
    
    open class func kLine() -> UIColor {
        return rgb(red: 225, green: 225, blue: 225)
    }
    
    open class func kBlue() -> UIColor {
        return rgb(red: 30, green: 120, blue: 250)
    }
    
    open class func kRed() -> UIColor {
        return rgb(red: 250, green: 60, blue: 30)
    }
    
    open class func rgb(red:Int,green:Int,blue:Int) -> UIColor {
        return UIColor(red: (CGFloat(red) / CGFloat255), green: (CGFloat(green) / CGFloat255), blue: (CGFloat(blue) / CGFloat255), alpha:1)
    }
    
    open class func rgba(red:Int,green:Int,blue:Int,alpha:Int) -> UIColor {
        return UIColor(red: (CGFloat(red) / CGFloat255), green: (CGFloat(green) / CGFloat255), blue: (CGFloat(blue) / CGFloat255), alpha:CGFloat(alpha))
    }
    
    open class func random() -> UIColor {
        return UIColor(red:CGFloat(arc4random_uniform(255)) / CGFloat255, green: CGFloat(arc4random_uniform(255)) / CGFloat255, blue: CGFloat(arc4random_uniform(255)) / CGFloat255, alpha: 0.8)
    }
}
