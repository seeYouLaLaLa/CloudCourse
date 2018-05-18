//
//  HorizontalWaterFlowLayout.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit


class HorizontalWaterFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        if let itemAttributes: [UICollectionViewLayoutAttributes] = super.layoutAttributesForElements(in: rect) {
            var itemX:CGFloat = CGFloat(0.0)
            var itemY:CGFloat = CGFloat(0.0)
            var itemRow:Int = 0
            for (idx,item) in itemAttributes.enumerated() {
                itemX = idx > 0 ? (itemAttributes[idx-1]).frame
                    .maxX : CGFloat(0.0);
                itemY = idx > 0 ? itemY : CGFloat(0.0)
                item.frame.origin.x = itemX + sectionInset.left;
                item.frame.origin.y = itemY + sectionInset.top;
                if(item.frame.maxX > ((collectionView?.bounds.size.width)! -  sectionInset.right - sectionInset.left)) {
                    itemRow += 1;
                    itemY = CGFloat(itemRow) * (item.frame.height + minimumLineSpacing);
                    item.frame.origin.x = (itemAttributes.first?.frame.origin.x)!;
                    item.frame.origin.y = itemY + sectionInset.top;
                }
            }
            return itemAttributes
        }
        return super.layoutAttributesForElements(in: rect)
    }
   
}
