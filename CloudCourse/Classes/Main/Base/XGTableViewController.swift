//
//  XGTableViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 23/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class XGTableViewController: XGViewController {
    
    lazy var tableView: UITableView = {
        let tableViewRect = (!hidesBottomBarWhenPushed) ? XGRect.visibleInNavTabRect(): XGRect.visibleNoTabRect()
        let tView = UITableView.init(frame: tableViewRect, style: tableViewStyle())
        tView.estimatedSectionFooterHeight = 0
        tView.estimatedSectionHeaderHeight = 0
        tView.estimatedRowHeight = 0
        tView.sectionFooterHeight = 0
        tView.sectionHeaderHeight = 0
        tView.separatorStyle = .none
        tView.separatorColor = UIColor.kLine()
        tView.backgroundColor = UIColor.page();
        tView.separatorColor = UIColor.kLightGray()
        tView.groupedStyleHeaderFooterInsetNone()
        tView.showsVerticalScrollIndicator = false
        tView.showsHorizontalScrollIndicator = false
        tView.mj_header = MJRefreshNormalHeader.init(refreshingTarget: self, refreshingAction: #selector(loadNewData))
        tView.mj_footer = MJRefreshAutoFooter.init(refreshingTarget: self, refreshingAction: #selector(loadMoreData))
        return tView
    }()
    
    func tableViewStyle() -> UITableViewStyle {
        return .grouped
    }
    
    @objc func loadNewData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.mj_header.endRefreshing()
            
        }
    }
    
    @objc func loadMoreData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tableView.mj_footer.endRefreshing()
        }
    }
    
    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        view.addSubview(tableView)
        if #available(iOS 11, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        refreshFooterIsHidden(true)
    }
    
}

extension XGTableViewController {
    func endRefreshing() -> Void {
        tableView.mj_header.endRefreshing()
        tableView.mj_footer.endRefreshing()
    }
    func refreshHeaderIsHidden(_ isHidden: Bool) -> Void {
        tableView.mj_header.isHidden = isHidden
    }
    func refreshFooterIsHidden(_ isHidden: Bool) -> Void {
        tableView.mj_footer.isHidden = isHidden
    }
}
