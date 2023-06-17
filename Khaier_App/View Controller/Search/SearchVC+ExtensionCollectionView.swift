//
//  SearchVC+ExtensionCollectionView.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 18/02/2023.
//

import UIKit

extension SearchViewController: CollectionViewConfig {
    
    func setCollectionView(){
        searchCollectionView.delegate = self
        searchCollectionView.dataSource = self
        searchCollectionView.register(cells: [SearchCollectionViewCell.self])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifierCell, for: indexPath) as! SearchCollectionViewCell
         cell.setSearchData(search: searchArray[indexPath.row])
        cell.donationNowAction = { [weak self] in
            guard let self = self else { return }
            let vc = DonationInViewController(id: self.searchArray[indexPath.row].id ?? 0)
            self.push(vc: vc)
        }
        return cell
    }
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: 160)
    }
    
}
