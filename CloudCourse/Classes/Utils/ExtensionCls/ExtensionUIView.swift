//
//  ExtensionUIView.swift
//  CloudCourse
//
//  Created by FSAnonymous on 19/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
extension UIView {
    open func shadowToTop() -> Void {
        self.layerShadow(color: UIColor.gray,
                         offset: CGSize(width: 0, height: -1.5),
                         radius: 1.5)
    }
    
    open func shadowToBottom() -> Void {
        self.layerShadow(color: UIColor.gray,
                         offset: CGSize(width: 0, height: 1.5),
                         radius: 1.5)
    }
    
    open func lineToNav() -> Void {
        self.layerShadow(color: UIColor.kLightGray(),
                         offset: CGSize(width: 0, height: 0.5),
                         radius: 0.5)
    }
    
    open func hiddenNavLine() -> Void {
        self.layerShadow(color: UIColor.kLightGray(),
                         offset: CGSize(width: 0, height: 0),
                         radius: 0)
    }
    
    open func layerShadow(color: UIColor,
                          offset: CGSize,
                          radius: CGFloat) {
        self.layer.shadowColor = color.cgColor;
        self.layer.shadowOffset = offset;
        self.layer.shadowRadius = radius;
        self.layer.shadowOpacity = 0.2;
        self.layer.shouldRasterize = true;
        self.layer.rasterizationScale = UIScreen.main.scale;
    }
}
