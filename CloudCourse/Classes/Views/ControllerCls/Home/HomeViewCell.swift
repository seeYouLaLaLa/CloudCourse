//
//  HomeViewCell.swift
//  CloudCourse
//
//  Created by FSAnonymous on 18/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class HomeViewCell: UICollectionViewCell {
    var item: Item? {
        didSet {
            textLabel?.text = item?.title
        }
    }
    var textLabel: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        textLabel = UILabel()
        textLabel?.font = UIFont.systemFont(ofSize: 14)
        textLabel?.textColor = UIColor.white
        self.contentView.addSubview(textLabel!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
