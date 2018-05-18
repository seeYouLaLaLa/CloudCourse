//
//  MineViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
struct ItemIdentifier {
    static let UITableViewCellId:String = "UITableViewCell"
}
class MineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Mine"
        self.view.backgroundColor = UIColor.white;
        
        self.view.addSubview(mineTableView);
    }
    
    lazy var mineTableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.separatorColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        tableView.tableFooterView = UIView()
        tableView.tableHeaderView = tableHeaderView
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ItemIdentifier.UITableViewCellId)
        return tableView
    }()
    
    lazy var tableHeaderView: UIView = {
        let W:CGFloat = self.view.bounds.size.width;
        let H:CGFloat = 220.0
        let iconWH:CGFloat = 70
        let view = UIView.init(frame: CGRect(x: 0, y: 0, width: W, height: H))
        view.backgroundColor = UIColor.main()
        let icon = UIImageView()
        icon.frame = CGRect(x: (W - iconWH) * 0.5, y: (H - iconWH) * 0.5, width: iconWH, height: iconWH)
        icon.backgroundColor = UIColor.rgb(red: 160, green: 160, blue: 160)
        icon.layer.cornerRadius = iconWH * 0.5
        view.addSubview(icon)
        return view
    }()

}
extension MineViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemIdentifier.UITableViewCellId, for: indexPath)
        cell.contentView.backgroundColor = UIColor.white
        return cell
    }
    
    
}
extension MineViewController:UITableViewDelegate {
    
}

