//
//  ExtensionUIImageView.swift
//  CloudCourse
//
//  Created by FSAnonymous on 25/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//
import Kingfisher

extension UIImageView {
    
    func xg_setImage(with resource: Resource?) {
        kf.setImage(with: resource,
                    placeholder: UIImage(named: "ic_image_placeholder"),
                    options:[.transition(.fade(0.25))])
    }
    
    func xg_setImage(with resource: Resource?, progressBlock: DownloadProgressBlock? = nil,
                     completionHandler: CompletionHandler? = nil) {
        kf.setImage(with: resource,placeholder: UIImage(named: "ic_image_placeholder"),options:[.transition(.fade(0.25))], progressBlock: { (receivedSize, totalSize) in
            if let progressBlock = progressBlock {
                progressBlock(receivedSize, totalSize)
            }
        }) { (image, error, cacheType, imageURL) in
            completionHandler?(image, error, cacheType, imageURL)
        }
    }
    
}
