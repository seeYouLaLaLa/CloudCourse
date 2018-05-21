//
//  ANavigtionBar.swift
//  CloudCourse
//
//  Created by FSAnonymous on 20/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class ANavigtionBar: UINavigationBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleTextAttributes = [.foregroundColor : UIColor.kBlack(), .font : UIFont.systemFont(ofSize: 17)]
        self.tintColor = UIColor.white
        self.barTintColor = UIColor.white
        self.shadowImage = UIImage()
        self.setBackgroundImage(UIImage(), for: .default)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for view in subviews {
            view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
}
