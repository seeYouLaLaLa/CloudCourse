//
//  MyCourseViewCell.swift
//  CloudCourse
//
//  Created by FSAnonymous on 25/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class MyCourseViewCell: XGTableViewCell {

    var iconView: UIImageView!
    var textView: UILabel!
    var item: Cell? {
        didSet {
            iconView.xg_setImage(with: (item?.url)!)
            textView.text = item?.type
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        iconView = UIImageView()
        iconView.contentMode = .scaleAspectFill
        iconView.layer.cornerRadius = 40
        iconView.clipsToBounds = true
        addSubview(iconView)
        
        textView = UILabel()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor.kBlack()
        addSubview(textView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.frame = CGRect(x: 10, y: 10, width: 80, height: 80)
        textView.frame = CGRect(x: iconView.frame.maxX + 8, y: iconView.center.y - 8, width: 60, height: 16)
    }

}
