//
//  ANavigtionBar.swift
//  CloudCourse
//
//  Created by FSAnonymous on 20/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class ANavigtionBar: UINavigationBar {
    override func layoutSubviews() {
        super.layoutSubviews()
        for view in subviews {
            view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
}
