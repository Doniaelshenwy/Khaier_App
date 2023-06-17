//
//  SkeletonViewManager.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Foundation
import SkeletonView

class SkeletonViewManager {
    
    private init() { }
    
    static func setSkelton(for collectionViews: [UICollectionView]) {
        collectionViews.forEach {
            $0.isSkeletonable = true
            $0.startSkeletonAnimation()
            $0.showGradientSkeleton()
        }
    }
    
    static func hideSkelton(for collectionViews: [UICollectionView]) {
        collectionViews.forEach {
            $0.stopSkeletonAnimation()
            $0.hideSkeleton()
        }
    }
    
    static func setSkelton(for tableViews: [UITableView]) {
        tableViews.forEach {
            $0.isSkeletonable = true
            $0.startSkeletonAnimation()
            $0.showGradientSkeleton()
        }
    }
    
    static func hideSkelton(for tableViews: [UITableView]) {
        tableViews.forEach {
            $0.stopSkeletonAnimation()
            $0.hideSkeleton()
        }
    }
}
