//
//  XYGradientView.swift
//  CloudCourse
//
//  Created by FSAnonymous on 22/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class XGGradientView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setGradient(colors:[CGColor], startPoint: CGPoint, endPoint: CGPoint) -> Void {
        (layer as! CAGradientLayer).frame = frame
        (layer as! CAGradientLayer).colors = colors
        (layer as! CAGradientLayer).startPoint = startPoint
        (layer as! CAGradientLayer).endPoint = endPoint
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
