//
//  SearchVC+ExtensionCollectionView.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 18/02/2023.
//

import UIKit

extension SearchViewController: CollectionViewConfig {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifierCell, for: indexPath) as! SearchCollectionViewCell
         cell.setSearchData(search: searchArray[indexPath.row])
        return cell
    }
    
    func setCollectionView(){
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(cells: [SearchCollectionViewCell.self])
    }
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 160)
    }
    
}
