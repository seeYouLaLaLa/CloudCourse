//
//  BaseViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 21/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
enum NavBarStyle {
    
    case defalut
    
    case blur

}
class BaseViewController: UIViewController {
    private var navigationBar: UIView?
    private var navigationBlur: UIVisualEffectView?
    private var titleView: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar = UIView()
        navigationBar?.backgroundColor = UIColor.white
        let blurEffect  = UIBlurEffect.init(style: UIBlurEffectStyle.extraLight)
        navigationBlur = UIVisualEffectView.init(effect: blurEffect)
        navigationBlur?.isHidden = true
        navigationBar?.addSubview(navigationBlur!)
        self.view.addSubview(navigationBar!)
        
        titleView = UIButton()
        titleView?.contentEdgeInsets = .zero
        titleView?.isHidden = false
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let navRect = (self.navigationController?.navigationBar.frame)
        navigationBar?.frame = CGRect(origin: CGPoint.zero, size: CGSize(width: (navRect?.size.width)!, height: (navRect?.maxY)!))
        navigationBlur?.frame = (navigationBar?.bounds)!
        self.view.bringSubview(toFront: navigationBar!)
    }
   
}

extension BaseViewController {
    
    final func navigationTitle(title:String) {
        navigationTitle(title: title,titleColor: UIColor.kBlack())
    }

    final func navigationTitle(title:String, titleColor: UIColor) {
        titleView?.isHidden = false
        titleView?.setTitle(title, for: .normal)
        titleView?.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        titleView?.setTitleColor(titleColor, for: .normal)
        titleView?.sizeToFit()
        self.navigationItem.titleView = titleView
    }
    
    final func navigationBarColor(color: UIColor) -> Void {
        self.navigationBarColor(color: color, style: .defalut)
    }
    
    final func navigationBarColor(color: UIColor, style: NavBarStyle) -> Void {
        self.navigationBlur?.isHidden = style != .blur
        self.navigationBar?.backgroundColor = color
    }
}
