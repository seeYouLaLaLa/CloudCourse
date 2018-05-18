//
//  NavigationController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 16/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor.black, .font : UIFont.boldSystemFont(ofSize: 16)]
        UINavigationBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.red
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().barTintColor = UIColor.white
    }


}
