//
//  MyCourseViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 24/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class MyCourseViewController: XGTableViewController {
    struct ItemId {
        static let XGTableViewCellId: String = "XGTableViewCell"
    }
    var itemArr: [Item]?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNav()
        setupView()
        loadNewData()
    }
    
    override func loadNewData() {
        weak var weak_self = self
        Item.getItems(success: { (respObject) in
            let respData = NSKeyedArchiver.archivedData(withRootObject: respObject)
            let items = try? JSONDecoder().decode([Item].self, from: respData)
            if let strong_self = weak_self {
                strong_self.itemArr = items
                strong_self.endRefreshing()
                strong_self.tableView.reloadData()
            }
        }) { (error) in
            print(error)
        }
    }
    
    func setupNav() -> Void {
        self.navigationItem.title = "我的课程"
    }
    
    func setupView() -> Void {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionFooterHeight = 10
        tableView.separatorColor = UIColor.kLine()
        tableView.separatorStyle = .singleLine
        tableView.register(XGTableViewCell.self, forCellReuseIdentifier: ItemId.XGTableViewCellId)
    }
    
    override func shouldShowBackItem() -> Bool {
        return false
    }
    
}


extension MyCourseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = itemArr else{
            return 0
        }
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemId.XGTableViewCellId, for: indexPath)
        let item =  itemArr![indexPath.row]
        cell.textLabel?.text = item.url
        return cell
    }
    
}



extension MyCourseViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

