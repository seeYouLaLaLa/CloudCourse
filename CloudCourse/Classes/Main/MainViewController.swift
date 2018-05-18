//
//  MainViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.main()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        
        let path = Bundle.main.path(forResource: "main-vc-setting", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: url)
        let result = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! Array<Any>
        guard let jsonResult = result else {
            return
        }
        for item in jsonResult {
            let dict = item as! Dictionary<String,String>
            let vcName:String! = dict["vc"];
            let title:String! = dict["title"];
            let icon:String! = dict["icon"];
            guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                print("namespace not be found")
                return
            }
            let cls : AnyClass? = NSClassFromString((nameSpace as! String) + "." + vcName)
            guard let clsType = cls as? UIViewController.Type else {
                print("convert to UIViewController type failure")
                return
            }
            self.addChildViewController(viewController: clsType.init(), title: title, icon: icon)
        }
    }
    
    func  addChildViewController(viewController:UIViewController ,title:String,icon:String) -> Void {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: icon)
        viewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0,vertical: -2)
        let nav = NavigationController.init(rootViewController:viewController)
        self.addChildViewController(nav);
    }


}
