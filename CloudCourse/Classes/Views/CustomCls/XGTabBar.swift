//
//  XGTabBar.swift
//  CloudCourse
//
//  Created by FSAnonymous on 19/6/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class XGTabBar: UITabBar {
    let indicatorView: XGGradientView!
    
    override init(frame: CGRect) {
        indicatorView = XGGradientView(frame: CGRect(x: 0, y: 0, width: 0, height: 49))
        indicatorView.setGradient(colors: [UIColor.kLightBlue().cgColor, UIColor.main().cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        
        super.init(frame: frame)
        
        insertSubview(indicatorView, at: 0)
        
        backgroundColor = UIColor.white
        
        tintColor = UIColor.white
        
        shadowImage = UIImage()
        
        backgroundImage = UIImage()
        
        shadowToTop()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let count = self.items?.count
        let width = self.frame.width / CGFloat (count!)
        var index = 0
        
        for control in self.subviews {
            if(control .isKind(of: NSClassFromString("UIControl")!) || control .isKind(of: NSClassFromString("UIButton")!)) {
                control.frame = CGRect(x: CGFloat(index) * width, y: 0, width: width, height: 49)
                index += 1
            }
        }
    }

}
