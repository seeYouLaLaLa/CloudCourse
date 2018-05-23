//
//  MineViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
import FDFullscreenPopGesture
struct ItemIdentifier {
    static let UITableViewCellId: String = "UITableViewCell"
}
class MineViewController: BaseViewController {
    var refreshControl: Any! = nil
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        naviBarColor(color: UIColor.kGreen())
        naviBottomLine(false)
    
        itemInNavBarLeft(true, item: UIBarButtonItem.buttonItem(imageName: "ic_mine_news", tintColor:UIColor.white,  target: nil, action: nil))
        
        itemInNavBarLeft(false, item: UIBarButtonItem.buttonItem(imageName: "ic_mine_setting", tintColor:UIColor.white,  target: nil, action: nil))
        
        navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_mine_title"))
        
        view.addSubview(mineTableView)
        
        mineTableView.insertSubview(stretchView, at: 0)
        
        if #available(iOS 11, *) {
            mineTableView.contentInsetAdjustmentBehavior = .never
        }else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        navigationBar.setGradient(colors: [UIColor.kLightGray().cgColor,UIColor.kGreen().cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))

    }
    
    lazy var stretchView: XGGradientView = {
       let view = XGGradientView.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: KRect.screenWidth(), height: 0.5)))
        view.setGradient(colors: [UIColor.kLightGray().cgColor,UIColor.kGreen().cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        return view
    }()
    
    lazy var mineTableView: UITableView = {
        let tableView = UITableView.init(frame: KRect.visibleInNavTabRect())
        tableView.estimatedSectionFooterHeight = 0.0
        tableView.estimatedSectionHeaderHeight = 0.0
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        tableView.backgroundColor = UIColor.page();
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorColor = UIColor.kLightGray()
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = tableHeaderView
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ItemIdentifier.UITableViewCellId)
        let refreshView = UIRefreshControl()
        refreshView.tintColor = UIColor.white
        refreshView.addTarget(self, action: #selector(refreshData), for: UIControlEvents.valueChanged)
        tableView.addSubview(refreshView)
        refreshControl = refreshView
        return tableView
    }()
    
    lazy var tableHeaderView: UIView = {
        let view = MineHeaderView()
        return view
    }()
    
    @objc func refreshData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            (self.refreshControl as AnyObject).endRefreshing()
            
        }
    }
    
}

extension MineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 100 : 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemIdentifier.UITableViewCellId, for: indexPath)
        cell.contentView.backgroundColor = UIColor.white
        let view = UIView()
        view.backgroundColor = UIColor.kLightGray()
        cell.selectedBackgroundView = view
        return cell
    }
}

extension MineViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.clear
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        stretchView.frame.origin.y = offsetY > 0 ? 0.5 : offsetY;
        stretchView.frame.size.height = offsetY > 0 ? 0.5 : -offsetY
    }
}
