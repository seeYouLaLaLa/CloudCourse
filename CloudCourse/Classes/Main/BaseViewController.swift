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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(navigationBar)
        displayBackItem()
    }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if !fd_prefersNavigationBarHidden {
            view.bringSubview(toFront: navigationBar)
        }
    }
    
    final lazy var titleView: UIButton = {
        let view = UIButton()
        view.contentEdgeInsets = .zero
        view.isHidden = true
        view.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return view
    }()
    
    final lazy var navigationBar: XGGradientView = {
        let view = XGGradientView()
        view.frame = XGRect.navBarRect()
        view.backgroundColor = UIColor.white
        view.addSubview(navigationBlur)
        return view
    }()
    
    final lazy var navigationBlur: UIVisualEffectView = {
        let effectView = UIVisualEffectView.init(effect: UIBlurEffect.init(style: UIBlurEffectStyle.extraLight))
        effectView.frame = XGRect.navBarRect()
        effectView.backgroundColor = UIColor.white
        effectView.isHidden = true
        return effectView
    }()
   
    func shouldShowBackItem() -> Bool {
        return true
    }
    
    @objc func backItemAction() -> Void {
        self.navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController {
    
    final func displayBackItem() -> Void {
        self.navigationItem.hidesBackButton = true;
        if shouldShowBackItem() {
            itemInNavBarLeft(true, item:  UIBarButtonItem.buttonItem(imageName: "ic_back_item",tintColor:UIColor.kBlack(),  target: self, action: #selector(backItemAction)))
        }
    }
    
    final func itemInNavBarLeft(_ left: Bool, item: UIBarButtonItem) -> Void {
        let insetItem = UIBarButtonItem.init(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        insetItem.width = -22
        if left {
            if #available(iOS 11, *) {
                self.navigationItem.leftBarButtonItems = [item]
            }else {
                if #available(iOS 10, *) {} else {
                    insetItem.width = -XGRect.pageInset().left
                }
                self.navigationItem.leftBarButtonItems = [insetItem,item]
            }
        }else {
            if #available(iOS 11, *) {
                self.navigationItem.rightBarButtonItems = [item]
            }else {
                if #available(iOS 10, *) {} else {
                    insetItem.width = -XGRect.pageInset().left
                }
                self.navigationItem.rightBarButtonItems = [insetItem,item]
            }
        }
    }
    
    final func naviBottomLine(_ show: Bool) {
        if show { navigationBar.lineToNav() } else { navigationBar.hiddenNavLine() }
        
    }
    
    final func naviTitle(title: String) {
       
        naviTitle(title: title, titleColor: UIColor.kBlack())
    
    }

    final func naviTitle(title:String, titleColor: UIColor) {
        
        titleView.isHidden = false
        titleView.setTitle(title, for: .normal)
        titleView.setTitleColor(titleColor, for: .normal)
        titleView.sizeToFit()
        
        navigationItem.titleView = titleView
    }
    
    final func naviBarColor(color: UIColor) -> Void {
        
        naviBarColor(color: color, style: .defalut)
        
    }
    
    final func naviBarColor(color: UIColor, style: NavBarStyle) -> Void {
        
        navigationBlur.isHidden = style != .blur
        
        navigationBar.backgroundColor = color
        
    }
}
