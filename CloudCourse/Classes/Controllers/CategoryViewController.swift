//
//  CategoryViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 20/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class CategoryViewController: XGViewController {
    struct ItemIdentifier {
        static let UITableViewCellId: String = "UITableViewCell"
    }
    var prevIndex = 0
    let hairStyleItems = ["长发","短发","中发","卷发","直发","BOB头","蛋卷头","梨花头"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "课程分类"
        self.view.backgroundColor = UIColor.white;
        self.view.addSubview(mineTableView);
    }
    
    lazy var mineTableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x: 0, y: self.view.bounds.origin.y, width: 100, height: self.view.bounds.height), style: .grouped)
        tableView.groupedStyleHeaderFooterInsetNone()
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ItemIdentifier.UITableViewCellId)
        tableView.backgroundColor = UIColor.kLightGray()
        return tableView
    }()
    
    lazy var selectView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.main()
        return view
    }()
    
    @objc override func shouldShowBackItem() -> Bool {
        return true
    }
   
}
extension CategoryViewController:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hairStyleItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemIdentifier.UITableViewCellId, for: indexPath)
        cell.contentView.backgroundColor = UIColor.white
        cell.textLabel?.text = hairStyleItems[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell.textLabel?.textColor = UIColor.kGray()
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.contentView.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.backgroundColor = UIColor.clear
        if self.prevIndex == indexPath.item {
            cell.contentView.backgroundColor = UIColor.white
            cell.textLabel?.textColor = UIColor.kBlack()
        }
        return cell
    }
}
extension CategoryViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.contentView.backgroundColor = UIColor.white
        cell?.textLabel?.textColor = UIColor.kBlack()
        self.prevIndex = indexPath.item
        tableView.reloadData()
        navigationController?.pushViewController(MyCourseViewController(), animated: true)
    }
}

