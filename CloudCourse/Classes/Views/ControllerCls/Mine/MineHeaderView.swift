//
//  MineHeaderView.swift
//  CloudCourse
//
//  Created by FSAnonymous on 21/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class MineHeaderView: XGGradientView {
    
    let kHeight: CGFloat = 100
    let kIconHeight: CGFloat = 60
    let kWidth: CGFloat = XGRect.screenWidth();
    var iconView: UIImageView!
    var nameView: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.main()
        self.frame = CGRect(x: CGPoint.zero.x, y: CGPoint.zero.y, width: kWidth, height: kHeight)
        
        iconView = UIImageView()
        iconView.layer.cornerRadius = kIconHeight * 0.5
        iconView.image = UIImage(named: "ic_head_icon")
        iconView.backgroundColor = UIColor.kGray()
        iconView.contentMode = .scaleAspectFit
        iconView.clipsToBounds = true
        addSubview(iconView)
        nameView = UILabel()
        nameView.text = "Anonymous"
        nameView.sizeToFit()
        nameView.textColor = UIColor.white
        nameView.font = UIFont.boldSystemFont(ofSize: 16)
        addSubview(nameView)
        
        setGradient(colors: [UIColor.kLightBlue().cgColor, UIColor.main().cgColor], startPoint: CGPoint.init(x: 0, y: 0), endPoint: CGPoint.init(x: 1, y: 0))

        
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        iconView.frame = CGRect(x: XGRect.pageInset().left, y: (kHeight - kIconHeight) * 0.5, width: kIconHeight, height: kIconHeight)
        nameView.frame = CGRect(x: iconView.frame.maxX + 10, y: iconView.frame.midX - 9, width: nameView.bounds.width, height: 18)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
