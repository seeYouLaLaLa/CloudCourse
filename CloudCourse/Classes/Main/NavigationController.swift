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
        self.navigationBar.layerBottomShadow()
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.black, .font : UIFont.boldSystemFont(ofSize: 16)]
        UINavigationBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = UIColor.white
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
