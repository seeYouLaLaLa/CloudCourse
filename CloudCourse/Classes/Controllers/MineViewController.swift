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
class MineViewController: UITableViewController {
    let scaleView = UIView()
    var refreshView: Any?

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "我的"
        self.view.backgroundColor = UIColor.white;
        self.fd_prefersNavigationBarHidden = true
        self.scaleView.backgroundColor = UIColor.kBlue()
        self.scaleView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 0.5)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = UIColor.white
        self.tableView.separatorColor = UIColor.kGray()
        self.tableView.tableFooterView = UIView()
        self.tableView.tableHeaderView = tableHeaderView
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ItemIdentifier.UITableViewCellId)
        let refreshControl = UIRefreshControl.init()
        self.refreshView = refreshControl
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(loadNewData), for: UIControlEvents.valueChanged)
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
            self.tableView.refreshControl = refreshControl
        }else {
            self.tableView.addSubview(refreshControl)
            self.automaticallyAdjustsScrollViewInsets = false
        }
        if #available(iOS 10.0, *) {
            self.tableView.refreshControl?.layoutMargins = UIEdgeInsets(top: 100, left: 0, bottom: 0, right: 0)
        } else {
            // Fallback on earlier versions
        }
        self.view.insertSubview(self.scaleView, at: 0)

    }
    
    @objc func loadNewData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            (self.refreshView as AnyObject).endRefreshing()
        }
        
    }
    lazy var tableHeaderView: UIView = {
        let W:CGFloat = self.view.bounds.size.width;
        
        let H:CGFloat = UIDevice.current.isPhoneX() ? 210 : 140
        let headIconWH:CGFloat = 70
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: W, height: H))
        view.backgroundColor = UIColor.kBlue()
        let headIcon = UIImageView(image: UIImage(named: "ic_head_icon"))
        headIcon.frame = CGRect(x: 16, y: (H - headIconWH) * 0.5, width: headIconWH, height: headIconWH)
        headIcon.backgroundColor = UIColor.kGray()
        headIcon.layer.cornerRadius = headIconWH * 0.5
        headIcon.contentMode = .scaleAspectFill
        headIcon.clipsToBounds = true
        view.addSubview(headIcon)
        return view
    }()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemIdentifier.UITableViewCellId, for: indexPath)
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        self.scaleView.frame.origin.y = offsetY > 0 ? 0.5 : offsetY;
        self.scaleView.frame.size.height = offsetY > 0 ? 0.5 : -offsetY
    }

}

