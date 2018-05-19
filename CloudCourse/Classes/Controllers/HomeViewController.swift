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
    var items0 = [Item]()
    var items1 = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CloudCourse"
        self.view.backgroundColor = UIColor.rgb(red: 255, green: 0, blue:0)
        let item0 = Item()
        item0.title = "我就是"
        
        let item1 = Item()
        item1.title = "踏遍上海滩的"
        
        let item2 = Item()
        item2.title = "红头发的"
        
        let item3 = Item()
        item3.title = "程序员就是啊程序员就是啊程序员就是啊程序员就是啊程序员就是啊程序员就是啊"
        
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
        
        items0.append(item0)
        items0.append(item1)
        items0.append(item2)
        items0.append(item3)
        items0.append(item4)
        items0.append(item5)
        items0.append(item6)
        items0.append(item7)
        items0.append(item8)
        items0.append(item9)
        items0.append(item10)
        items0.append(item11)
        items0.append(item12)

        
        let item100 = Item()
        item100.title = "xxx"
        
        let item111 = Item()
        item111.title = "戏码阿斯顿撒"
        
        let item122 = Item()
        item122.title = "123423423"
        
        let item133 = Item()
        item133.title = "121"
        
        let item144 = Item()
        item144.title = "oop"
        
        let item155 = Item()
        item155.title = "p'p'f'p"
        
        let item166 = Item()
        item166.title = "as"
        
        let item177 = Item()
        item177.title = "20我就是ww"
        
        
        items1.append(item100)
        items1.append(item111)
        items1.append(item122)
        items1.append(item133)
        items1.append(item144)
        items1.append(item155)
        items1.append(item166)
        items1.append(item177)
        
        
        self.view.addSubview(homeColletionView)

    }
    
    
    lazy var itemLayout:UICollectionViewFlowLayout = {
        let layout = ALeftAlignedFlowLayout()
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
        if section % 2 == 0 {
            return items0.count
        }
        return items1.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:HomeViewController.itemIdentifier, for: indexPath) as! HomeViewCell
        if indexPath.section % 2 == 0 {
            cell.item = items0[indexPath.item]
        }else {
            cell.item = items1[indexPath.item]
        }
        return cell
    }
}

extension HomeViewController:UICollectionViewDelegate {
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section % 2 == 0 {
            return items0[indexPath.item].itemSize
        }
        return items1[indexPath.item].itemSize
    }
}
