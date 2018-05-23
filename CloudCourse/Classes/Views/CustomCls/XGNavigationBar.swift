//
//  XGNavigationBar.swift
//  CloudCourse
//
//  Created by FSAnonymous on 20/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class XYNavigationBar: UINavigationBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shadowImage = UIImage()
        
        tintColor = UIColor.kGreen()
        
        barTintColor = UIColor.kGreen()
        
        setBackgroundImage(UIImage(), for: .default)
        
        titleTextAttributes = [.foregroundColor : UIColor.kBlack(), .font : UIFont.systemFont(ofSize: 17)]
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if #available(iOS 11, *) {
            for view in subviews {
                view.layoutMargins = UIEdgeInsets.zero
            }
        }
    }
}
