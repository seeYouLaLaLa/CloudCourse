//
//  Item.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
struct ItemInfo {
   static let sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
   static let maxWidth = UIScreen.main.bounds.width - sectionInset.left - sectionInset.right - 16
}
class Item : NSObject {
    
    var title: String?
    
    var width: CGFloat = 0.0
    
    var textSize: CGSize = CGSize.zero
    
    var itemSize: CGSize {
        get {
            if textSize.width > 0.0 {
                return textSize
            }else {
                if var size = title?.size(font: UIFont.systemFont(ofSize: 14), maxWidth: ItemInfo.maxWidth, maxHeight: 200) {
                    size = CGSize(width: size.width + 16, height: size.height + 16)
                    textSize = size
                    return textSize
                }
                return CGSize.zero
            }
        }
    }
    
    
}
