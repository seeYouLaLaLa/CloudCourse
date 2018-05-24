//
//  ExtensionUIBarButtonItem.swift
//  CloudCourse
//
//  Created by FSAnonymous on 22/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
extension UIBarButtonItem {
    open class func item(imageName: String, tintColor: UIColor?, target: Any?, action: Selector?) -> UIBarButtonItem{
        return item(imageName: imageName, title: nil, tintColor: tintColor, target: target, action: action)
    }
    
    open class func item(title: String, tintColor: UIColor?, target: Any?, action: Selector?) -> UIBarButtonItem{
        return item(imageName: nil, title: title, tintColor: tintColor, target: target, action: action)
    }
    
    open class func item(imageName: String?,title: String?, tintColor: UIColor?, target: Any?, action: Selector?) -> UIBarButtonItem{
        let itemButton = UIButton.init()
        itemButton.contentEdgeInsets = XGRect.navgationItemInset()
        if imageName != nil && title != nil {
            itemButton.titleEdgeInsets.left = 6
        }
        
        if title != nil {
            itemButton.setTitle(title, for: .normal)
            itemButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            if tintColor != nil {
                itemButton.setTitleColor(tintColor, for: .normal)
            }
        }
        
        if imageName != nil {
            var image = UIImage(named: imageName!)
            if tintColor != nil {
                itemButton.imageView?.tintColor = tintColor
                image = image?.withRenderingMode(.alwaysTemplate)
            }
            itemButton.setImage(image, for: .normal)
        }
        
        if target != nil {
            itemButton.addTarget(target, action: action!, for: .touchUpInside)
        }
        
        itemButton.sizeToFit()
        itemButton.frame.size.height = 44
        return UIBarButtonItem(customView: itemButton)
    }
}
