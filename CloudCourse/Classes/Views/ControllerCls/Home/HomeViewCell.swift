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
            textButton?.setTitle(item?.title, for: UIControlState.normal)
        }
    }
    var textButton: UIButton?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        textButton = UIButton.init()
        textButton?.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        textButton?.setTitleColor(UIColor.white, for: UIControlState.normal)
        textButton?.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        textButton?.titleLabel?.numberOfLines = 0
        textButton?.layer.cornerRadius = 3
        textButton?.backgroundColor = UIColor.main()
        textButton?.isUserInteractionEnabled = false
        self.contentView.addSubview(textButton!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textButton?.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
