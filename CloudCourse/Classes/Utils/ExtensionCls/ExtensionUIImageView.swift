//
//  ExtensionUIImageView.swift
//  CloudCourse
//
//  Created by FSAnonymous on 25/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//
import Kingfisher

extension UIImageView {
    
    func xg_setImage(with url: String) {
        kf.setImage(with: URL(string: url),
                    placeholder: UIImage(named: "ic_image_placeholder"),
                    options:[.transition(.fade(0.2))])
    }
   
}
