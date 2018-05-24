//
//  XGTableViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 23/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
import MJRefresh

class XGTableViewController: XGViewController {
    
    lazy var tableView: UITableView = {
        let tableViewRect = ((navigationController?.viewControllers.count)! <= 1) ? XGRect.visibleInNavTabRect(): XGRect.visibleNoTabRect()
        let tView = UITableView.init(frame: tableViewRect, style: .grouped)
        tView.estimatedSectionFooterHeight = 0.0
        tView.estimatedSectionHeaderHeight = 0.0
        tView.sectionFooterHeight = XGRect.sectionHeight()
        tView.sectionHeaderHeight = 0.01
        tView.separatorStyle = .none
        tView.separatorColor = UIColor.kLine()
        tView.backgroundColor = UIColor.page();
        tView.separatorColor = UIColor.kLightGray()
        tView.tableFooterView = UIView()
        tView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        tView.mj_footer = MJRefreshAutoFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        return tView
    }()
    
    @objc func loadNewData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.mj_header.endRefreshing()
            
        }
    }
    
    @objc func loadMoreData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.tableView.mj_footer.endRefreshing()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        refreshFooterIsHidden(true)
        if #available(iOS 11, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }
}
extension XGTableViewController {
    func refreshHeaderIsHidden(_ isHidden: Bool) -> Void {
        tableView.mj_header.isHidden = isHidden
    }
    func refreshFooterIsHidden(_ isHidden: Bool) -> Void {
        tableView.mj_footer.isHidden = isHidden
    }
}
