//
//  HomeViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    static let itemIdentifier = "HomeViewCell"
    var items = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CloudCourse"
        self.view.backgroundColor = UIColor.rgb(red: 255, green: 0, blue:0)
        let item0 = Item()
        item0.title = "我就是"
        
        let item1 = Item()
        item1.title = "那个"
        
        let item2 = Item()
        item2.title = "红头发的"
        
        let item3 = Item()
        item3.title = "程序员就是啊"
        
        let item4 = Item()
        item4.title = "哈哈哈"
        
        let item5 = Item()
        item5.title = "你不知道么"
        
        let item6 = Item()
        item6.title = "其实"
        
        let item7 = Item()
        item7.title = "我就是当年"
        
        let item8 = Item()
        item8.title = "踏遍上海滩的"
        
        let item9 = Item()
        item9.title = "许文强转世"
        
        let item10 = Item()
        item10.title = "走着走着"
        
        let item11 = Item()
        item11.title = "就散了"
        
        let item12 = Item()
        item12.title = "就不知道了"
        
        items.append(item0)
        items.append(item1)
        items.append(item2)
        items.append(item3)
        items.append(item4)
        items.append(item5)
        items.append(item6)
        items.append(item7)
        items.append(item8)
        items.append(item9)
        items.append(item10)
        items.append(item11)
        items.append(item12)

        self.view.addSubview(homeColletionView)

    }
    
    
    lazy var itemLayout:UICollectionViewFlowLayout = {
        let layout = HorizontalWaterFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 40) * 0.25
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    lazy var homeColletionView:UICollectionView = {
        let colletionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: itemLayout)
        colletionView.backgroundColor = UIColor.white
        colletionView.dataSource = self;
        colletionView.delegate = self;
        colletionView.register(HomeViewCell.classForCoder(), forCellWithReuseIdentifier:HomeViewController.itemIdentifier)
        return colletionView
    }()
    
}

extension HomeViewController:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:HomeViewController.itemIdentifier, for: indexPath) as! HomeViewCell
        cell.contentView.backgroundColor = UIColor.main()
        cell.item = items[indexPath.item]
        return cell
    }
    
    
}

extension HomeViewController:UICollectionViewDelegate {
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = items[indexPath.item]
        return CGSize(width: item.itemWidth, height: 24)
    }
}
