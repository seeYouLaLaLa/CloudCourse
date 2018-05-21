//
//  ExtensionString.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

extension String {
    
    func width(font:UIFont, maxWidth: CGFloat = CGFloat(MAXFLOAT)) -> CGFloat {
        return size(font: font, maxWidth: maxWidth, maxHeight: CGFloat(MAXFLOAT)).width
    }
    
    func height(font:UIFont,maxWidth:CGFloat) -> CGFloat {
        return size(font: font, maxWidth: maxWidth, maxHeight: CGFloat(MAXFLOAT)).height
    }
    
    func size(font:UIFont, maxWidth:CGFloat, maxHeight:CGFloat) -> CGSize {
        let size = self.boundingRect(with: CGSize(width: maxWidth, height: maxHeight), options: .usesLineFragmentOrigin, attributes: [.font:font], context: nil).size
        return CGSize(width: ceil(size.width), height: ceil(size.height))
        
    }
}
