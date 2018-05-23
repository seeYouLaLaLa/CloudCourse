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
        layerShadow(color: UIColor.gray,
                    offset: CGSize(width: 0, height: -1.5),
                    radius: 1.5)
    }
    
    open func shadowToBottom() -> Void {
        layerShadow(color: UIColor.gray,
                    offset: CGSize(width: 0, height: 1.5),
                    radius: 1.5)
    }
    
    open func lineToNav() -> Void {
        layerShadow(color: UIColor.gray,
                    offset: CGSize(width: 0, height: 0.5),
                    radius: 0)
    }
    
    open func hiddenNavLine() -> Void {
        self.layerShadow(color: UIColor.kLine(),
                         offset: CGSize(width: 0, height: 0),
                         radius: 0)
    }
    
    open func layerShadow(color: UIColor,
                          offset: CGSize,
                          radius: CGFloat) {
        layer.shadowColor = color.cgColor;
        layer.shadowOffset = offset;
        layer.shadowRadius = radius;
        layer.shadowOpacity = 0.2;
        layer.shouldRasterize = true;
        layer.rasterizationScale = UIScreen.main.scale;
    }
}
