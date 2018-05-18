//
//  ExtensionString.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

extension String {
    
    func textHeight(font:UIFont,maxWidth:CGFloat) -> CGFloat {
       return ceil(textSize(font: font, maxWidth: maxWidth, maxHeight: CGFloat(MAXFLOAT)).height)
    }
    
    func textWidth(font:UIFont) -> CGFloat {
        return ceil(textSize(font: font, maxWidth: CGFloat(MAXFLOAT), maxHeight: CGFloat(MAXFLOAT)).width)
    }
    
    func textSize(font:UIFont, maxWidth:CGFloat, maxHeight:CGFloat) -> CGSize {
        return self.boundingRect(with: CGSize(width: maxWidth, height: maxHeight), options: .usesLineFragmentOrigin, attributes: [.font:font], context: nil).size
    }
}
