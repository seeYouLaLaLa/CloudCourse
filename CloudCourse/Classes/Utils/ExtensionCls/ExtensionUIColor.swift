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
        return rgb(red: 53, green: 180, blue: 60)
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
