//
//  CategoriesVC+ExtensionCollectionView.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit

extension CategoriesViewController: CollectionViewConfig {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifierCell, for: indexPath) as! CategoriesCollectionViewCell
        cell.setCategoryData(category: categoriesArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = OneCategoryViewController(nibName: "OneCategoryViewController", bundle: nil)
        vc.titleNavigation = categoriesArray[indexPath.row].nameCategories
        push(vc: vc)
    }
    
    func setCategoryCollectionView() {
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(cells: [CategoriesCollectionViewCell.self])
    }
    
}

extension CategoriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 2) - 7, height: 121)
    }
    
}
