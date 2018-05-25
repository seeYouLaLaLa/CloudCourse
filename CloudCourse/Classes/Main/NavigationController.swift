//
//  NavigationController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 16/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    var leftView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override var childViewControllerForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
}
