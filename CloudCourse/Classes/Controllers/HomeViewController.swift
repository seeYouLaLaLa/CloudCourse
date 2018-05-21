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
        self.view.backgroundColor = UIColor.white
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: UIImageView.init(image: UIImage(named: "ic_logo")))
        let item0 = Item()
        item0.title = "纸"
        
        let item1 = Item()
        item1.title = "上"
        
        let item2 = Item()
        item2.title = "得"
        
        let item3 = Item()
        item3.title = "来"
        
        let item4 = Item()
        item4.title = "终"
        
        let item5 = Item()
        item5.title = "觉"
        
        let item6 = Item()
        item6.title = "浅"
        
        let item7 = Item()
        item7.title = "绝"
        
        let item8 = Item()
        item8.title = "知"
        
        let item9 = Item()
        item9.title = "此"
        
        let item10 = Item()
        item10.title = "事"
        
        let item11 = Item()
        item11.title = "要"
        
        let item12 = Item()
        item12.title = "躬"
        let item13 = Item()
        item13.title = "行"

        
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
        items0.append(item13)

        
        let item100 = Item()
        item100.title = "A"
        
        let item111 = Item()
        item111.title = "B"
        
        let item122 = Item()
        item122.title = "C"
        
        let item133 = Item()
        item133.title = "D"
        
        let item144 = Item()
        item144.title = "E"
        
        let item155 = Item()
        item155.title = "F"
        
        let item166 = Item()
        item166.title = "G"
        
        let item177 = Item()
        item177.title = "H"
        
        
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
        let layout = UICollectionViewFlowLayout()
        let itemWH = (UIScreen.main.bounds.width - 56) * 0.25
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.itemSize = CGSize(width: itemWH, height: itemWH)
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
        return 3;
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(MineViewController(), animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}
