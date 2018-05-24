//
//  XGTableViewCell.swift
//  CloudCourse
//
//  Created by FSAnonymous on 23/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class XGTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.white
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor = UIColor.kLightGray()
    }
    
    override func awakeFromNib() {
        contentView.backgroundColor = UIColor.white
        selectedBackgroundView = UIView()
        selectedBackgroundView?.backgroundColor =  UIColor.kLightGray()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
