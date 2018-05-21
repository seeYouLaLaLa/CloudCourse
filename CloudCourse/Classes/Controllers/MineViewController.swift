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
    let scaleView = UIView()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBarColor(color: UIColor.kGreen())
        self.view.backgroundColor = UIColor.white;
        self.scaleView.backgroundColor = UIColor.kGreen()
        self.scaleView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 0.5)
        self.view.addSubview(mineTableView)
        self.mineTableView.insertSubview(self.scaleView, at: 0)
        self.navigationTitle(title: "个人中心", titleColor: UIColor.white)
    }
    
    lazy var mineTableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorColor = UIColor.kGray()
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = tableHeaderView
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ItemIdentifier.UITableViewCellId)
        return tableView
    }()
    
    lazy var tableHeaderView: UIView = {
        let W:CGFloat = self.view.bounds.size.width;
        let H:CGFloat = 140
        let headIconWH:CGFloat = 60
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: W, height: H))
        view.backgroundColor = UIColor.kGreen()
        let headIcon = UIImageView(image: UIImage(named: "ic_head_icon"))
        headIcon.frame = CGRect(x: 16, y: (H - headIconWH) * 0.5, width: headIconWH, height: headIconWH)
        headIcon.backgroundColor = UIColor.kGray()
        headIcon.layer.cornerRadius = headIconWH * 0.5
        headIcon.contentMode = .scaleAspectFit
        headIcon.clipsToBounds = true
        view.addSubview(headIcon)
        return view
    }()
}

extension MineViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemIdentifier.UITableViewCellId, for: indexPath)
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
}

extension MineViewController: UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y;
        self.scaleView.frame.origin.y = offsetY > 0 ? 0.5 : offsetY;
        self.scaleView.frame.size.height = offsetY > 0 ? 0.5 : -offsetY
    }
}
