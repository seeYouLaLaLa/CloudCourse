//
//  HomeViewController.swift
//  CloudCourse
//
//  Created by FSAnonymous on 15/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let itemIdentifier = "UICollectionViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "CloudCourse"
        self.view.backgroundColor = UIColor.rgb(red: 255, green: 0, blue:0)
        
        self.view.addSubview(homeColletionView)
        
    }

    lazy var itemLayout:UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.size.width - 40) * 0.25
        layout.sectionInset = UIEdgeInsets(top: 16, left: 8, bottom: 16, right: 8)
        layout.itemSize = CGSize(width: itemSize, height: 44)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        return layout
    }()
    
    lazy var homeColletionView:UICollectionView = {
        let colletionView = UICollectionView.init(frame: self.view.bounds, collectionViewLayout: itemLayout)
        colletionView.backgroundColor = UIColor.white
        colletionView.dataSource = self;
        colletionView.delegate = self;
        colletionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier:itemIdentifier)
        return colletionView
    }()
    
}

extension HomeViewController:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 7;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 13
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:itemIdentifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor.random()
        return cell
    }
    
    
}
extension HomeViewController:UICollectionViewDelegate {
    
}
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
}
