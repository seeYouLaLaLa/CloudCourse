//
//  Item.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class Item : NSObject {
    
    var title:String?
    
    var width:CGFloat = 0.0
    
    var itemWidth:CGFloat {
        get {
            if width > 0.0 {
                return width
            }else {
                if let textWidth = title?.textWidth(font: UIFont.systemFont(ofSize: 14)) {
                    width = textWidth
                    return width
                }
                return 0.0
            }
        }
    }
    
  
}
