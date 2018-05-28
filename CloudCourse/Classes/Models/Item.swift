//
//  Item.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
import Alamofire
public typealias Success = ((_ jsonObject : Any) -> Void)
public typealias Failure = ((_ error: NSError) -> Void)

struct ItemInfo {
   static let sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
   static let maxWidth = UIScreen.main.bounds.width - sectionInset.left - sectionInset.right - 16
}

class Item: Codable{
  
    var url: String?
    
    var title: String?
    
    var width: CGFloat = 0.0
    
    var textSize: CGSize = CGSize.zero
    
    var itemSize: CGSize {
        get {
            if textSize.width > 0.0 {
                return textSize
            }else {
                if var size = title?.size(font: UIFont.systemFont(ofSize: 14), maxWidth: ItemInfo.maxWidth, maxHeight: 200) {
                    size = CGSize(width: size.width + 8, height: size.height + 6)
                    textSize = size
                    return textSize
                }
                return CGSize.zero
            }
        }
    }    
    
}
























