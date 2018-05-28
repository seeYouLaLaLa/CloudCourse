//
//  MyCourseViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 24/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit
import Alamofire
class MyCourseViewController: XGTableViewController {
    struct ItemId {
        static let MyCourseViewCellId: String = "MyCourseViewCell"
    }
    var itemArr: [Cell]?
    var page: Int64 = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNav()
        setupView()
        loadNewData()
    }
    func getItems(page: Int64, success: @escaping Success, failure: @escaping Failure) -> Void {
        Alamofire.request("https://www.apiopen.top/meituApi?page=\(page)").responseJSON { (respJson) in
            respJson.result.ifSuccess {
                if let obj = respJson.result.value as? Dictionary<String, Any> {
                    let arr = obj["data"]
                    if let items = arr {
                        success(items)
                    }
                }
            }
            respJson.result.ifFailure {
                
            }
        }
    }
    
    override func loadNewData() -> Void {
        page = 1
        loadData()
    }
    
    override func loadMoreData() -> Void {
        page += 1
        loadData()
    }
    
    private func loadData() -> Void {
        weak var weak_self = self
        getItems(page: page, success: { (respObject) in
            let data = try? JSONSerialization.data(withJSONObject: respObject, options: JSONSerialization.WritingOptions.prettyPrinted)
            let items = try? JSONDecoder().decode([Cell].self, from: data!)
           
            if let strong_self = weak_self {
                strong_self.endRefreshing()
                if strong_self.page == 1 && (items?.count)! > 0 {
                    strong_self.itemArr = items
                    strong_self.refreshFooterIsHidden(false)
                }
                guard (items?.count)! > 0 else {
                    strong_self.page = 1
                    strong_self.refreshFooterIsHidden(true)
                    return
                }
                let tempArr = strong_self.itemArr
                
                strong_self.itemArr = tempArr! + items!

               
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
        tableView.rowHeight = 100
        tableView.separatorColor = UIColor.kLine()
        tableView.separatorStyle = .singleLine
        tableView.register(MyCourseViewCell.self, forCellReuseIdentifier: ItemId.MyCourseViewCellId)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: ItemId.MyCourseViewCellId, for: indexPath) as! MyCourseViewCell
        let item =  itemArr![indexPath.row]
        cell.item = item
        return cell
    }
    
}



extension MyCourseViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

