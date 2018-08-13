//
//  XGNavigationBar.swift
//  CloudCourse
//
//  Created by FSAnonymous on 20/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class XGNavigationBar: UINavigationBar {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        shadowImage = UIImage()
        
        tintColor = UIColor.main()
        
        setBackgroundImage(UIImage(), for: .default)
        
        backIndicatorImage = UIImage(named: "ic_logo")
        
        backIndicatorTransitionMaskImage = UIImage(named: "ic_logo")
        
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
