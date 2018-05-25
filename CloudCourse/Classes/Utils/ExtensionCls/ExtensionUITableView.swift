//
//  ExtensionUITableView.swift
//  CloudCourse
//
//  Created by FSAnonymous on 25/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
extension UITableView {
   
    func groupedStyleHeaderFooterInsetNone() -> Void {
        if style == .grouped {
            groupedStyleHeaderInsetNone()
            groupedStyleFooterInsetNone()
        }
       
    }
    
    func groupedStyleHeaderInsetNone() -> Void {
        tableHeaderView = UIView.init(frame: CGRect(x: CGRect.zero.minX, y: CGRect.zero.minY, width: CGRect.zero.width, height: 0.001))
        
    }
    
    func groupedStyleFooterInsetNone() -> Void {
        tableFooterView = UIView.init(frame: CGRect(x: CGRect.zero.minX, y: CGRect.zero.minY, width: CGRect.zero.width, height: 0.001))
    }
}
