//
//  HorizontalWaterFlowLayout.swift
//  CloudCourse
//
//  Created by FSAnonymous on 17/5/18.
//  Copyright © 2018年 CloudCourse. All rights reserved.
//

import UIKit

class ALeftAlignedFlowLayout: UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let layoutAttibutesArr = super.layoutAttributesForElements(in: rect) else {
            return super.layoutAttributesForElements(in: rect);
        }
        var prevFrame:CGRect = CGRect.zero
        for layoutAttibutes in layoutAttibutesArr {
            if (layoutAttibutes.representedElementKind == nil) {
                layoutAttibutes.frame = self.layoutAttributesForItem(layoutAttibutes: layoutAttibutes, prevFrame: prevFrame).frame;
            }
            prevFrame = layoutAttibutes.frame
        }
        return layoutAttibutesArr;
    }
    
    private func layoutAttributesForItem(layoutAttibutes: UICollectionViewLayoutAttributes, prevFrame: CGRect) -> UICollectionViewLayoutAttributes {
        let itemOriginX = prevFrame.maxX + self.minimumInteritemSpacing;
        let limitRangeFrame = CGRect(x: 0, y: (layoutAttibutes.frame.origin.y), width: self.collectionView!.frame.width, height: (layoutAttibutes.frame.height));
        if prevFrame.intersects(limitRangeFrame) {
            layoutAttibutes.frame.origin.x = itemOriginX;
        }else {
            layoutAttibutes.frame.origin.x = sectionInset.left;
        }
        return layoutAttibutes;
    }
}
