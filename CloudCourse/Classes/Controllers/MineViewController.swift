//
//  MineViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit


class MineViewController: XGTableViewController {
    struct ItemId {
        static let XGTableViewCellId: String = "XGTableViewCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupView()
    }
    
    func setupNav() -> Void {
        showItem(at: .left, item: UIBarButtonItem.item(imageName: "ic_mine_news", tintColor:UIColor.white,  target: nil, action: nil))
        showItem(at: .right, item: UIBarButtonItem.item(imageName: "ic_mine_setting", tintColor:.white,  target: nil, action: nil))
        navigationItem.titleView = UIImageView.init(image: UIImage(named: "ic_mine_title"))
        naviBarColor(colors: [UIColor.kLightBlue().cgColor, UIColor.main().cgColor])
    }
    
    func setupView() -> Void {
        refreshHeaderIsHidden(true)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableHeaderView = tableHeaderView
        tableView.insertSubview(stretchView, at: 0)
        tableView.insertSubview(refreshControl, aboveSubview: stretchView)
        tableView.register(XGTableViewCell.self, forCellReuseIdentifier: ItemId.XGTableViewCellId)
    }
    
    lazy var refreshControl: UIRefreshControl = {
        let refreshView = UIRefreshControl()
        refreshView.tintColor = UIColor.white
        refreshView.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refreshView
    }()
    
    lazy var stretchView: XGGradientView = {
       let view = XGGradientView.init(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: XGRect.screenWidth(), height: 0.5)))
        view.setGradient(colors: [UIColor.kLightBlue().cgColor, UIColor.main().cgColor], startPoint: CGPoint.init(x: 0, y: 0), endPoint: CGPoint.init(x: 1, y: 0))
        return view
    }()
    
    lazy var tableHeaderView: UIView = {
        let view = MineHeaderView.init(frame: CGRect.zero)
        view.frame.size.height = 100
        return view
    }()
}

extension MineViewController {
   
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @objc func refreshData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            (self.refreshControl as AnyObject).endRefreshing()
            
        }
    }
}

extension MineViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 100 : 200
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemId.XGTableViewCellId, for: indexPath)
        return cell
    }
}

extension MineViewController: UITableViewDelegate{
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        stretchView.frame.origin.y = offsetY > 0 ? 0.5 : offsetY;
        stretchView.frame.size.height = offsetY > 0 ? 0.5 : -offsetY
    }
}
