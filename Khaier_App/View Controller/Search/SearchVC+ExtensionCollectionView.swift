//
//  SearchVC+ExtensionCollectionView.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 18/02/2023.
//

import UIKit

//extension SearchViewController: TableViewConfig{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return searchArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifierCell) as! SearchTableViewCell
//        return cell
//    }
//
//    func setCollectionView(){
//        searchTableView.delegate = self
//        searchTableView.dataSource = self
//        searchTableView.register(UINib(nibName: SearchTableViewCell.identifierCell, bundle: nil), forCellReuseIdentifier: SearchTableViewCell.identifierCell)
//        searchTableView.separatorStyle = .none
//
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 176
//    }
//
//}

extension SearchViewController: CollectionViewConfig{
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
        searchCollectionView.register(UINib(nibName: SearchCollectionViewCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: SearchCollectionViewCell.identifierCell)
         //   setUPVertical()
      
    }
    
//    func setUPVertical(){
//        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//
//        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.54)), subitem: item, count: 2)
//
//
//        let section = NSCollectionLayoutSection(group: verticalGroup)
//        let layout = UICollectionViewCompositionalLayout(section: section)
//        searchCollectionView.collectionViewLayout = layout
//    }
    
    
}

extension SearchViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width + 16, height: 160)
    }
}
