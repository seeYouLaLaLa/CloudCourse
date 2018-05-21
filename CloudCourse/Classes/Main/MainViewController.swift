//
//  MainViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
import AudioToolbox
class MainViewController: UITabBarController {
    var tabBarbuttons: [Any]?
    var tabBarIndicator: UIView?
    var tabBarColor = [UIColor.kBlue(),UIColor.kRed(),UIColor.kGreen()]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.shadowToTop()

        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().tintColor = UIColor.white
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
            let vcName: String! = dict["vc"];
            guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                print("namespace not be found")
                return
            }
            let cls : AnyClass? = NSClassFromString((nameSpace as! String) + "." + vcName)
            guard let clsType = cls as? UIViewController.Type else {
                print("convert to UIViewController type failure")
                return
            }
            self.addChildViewController(viewController: clsType.init(), title: dict["title"]!, icon: dict["icon"]!)
        }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let index = self.tabBar.items!.index(of: item)!
        playTabBarItemSound()
        if tabBarbuttons != nil {
            CAAnimation.tabBarItemAnimation(at: index, tabBarIndicator: self.tabBarIndicator!, tabBar: tabBar, color: tabBarColor)
            CAAnimation.tabBarClickAnimation(at: index, buttons: tabBarbuttons!)
        }
        
    }
    
    func addChildViewController(viewController: UIViewController, title: String, icon: String) {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: icon)
        viewController.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0,vertical: -2)
        let nav = NavigationController.init(navigationBarClass: ANavigtionBar.self, toolbarClass: UIToolbar.self)
        nav.pushViewController(viewController, animated: true)
        
        self.addChildViewController(nav);
    }
    
    func tabBarButtons(at index: Int,tabBar: UITabBar) ->[Any] {
        var buttons = [Any]()
        for tabBarSubView in tabBar.subviews {
            if tabBarSubView.isKind(of: NSClassFromString("UITabBarButton")!) {
                buttons.append(tabBarSubView)
            }
        }
        return buttons
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if tabBarbuttons == nil && (self.tabBar.items?.count)! > 0  {
            tabBarbuttons = self.tabBarButtons(at: 0, tabBar: self.tabBar)
        }
    }
    
    func playTabBarItemSound() {
        let path = Bundle.main.path(forResource: "tap", ofType: "caf")
        var soundId: SystemSoundID = 0
        let url = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(url as CFURL, &soundId)
        AudioServicesPlaySystemSound(soundId);
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if tabBarIndicator == nil {
            tabBarIndicator = UIView.init(frame: CGRect(x: 0, y: 0, width: tabBar.bounds.width / (CGFloat((tabBar.items?.count)!)), height: 49))
            tabBarIndicator?.backgroundColor = UIColor.kBlue()
            self.tabBar.insertSubview(tabBarIndicator!, at: 0)
        }
    }
}
