//
//  HomeVC+ExtensionCollectionView.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/02/2023.
//

import Foundation
import UIKit

extension HomeViewController: CollectionViewConfig{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case priorityCollectionView:
            return priorityArray.count
        case nearCollectionView:
            return nearArray.count
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == priorityCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PriorityCollectionViewCell.identifierCell, for: indexPath) as! PriorityCollectionViewCell
            cell.setCaseData(priority: priorityArray[indexPath.row])
            return cell
        }
        else if collectionView == nearCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearCollectionViewCell.identifierCell, for: indexPath) as! NearCollectionViewCell
            cell.setCharityData(near: nearArray[indexPath.row])
            return cell
        }
        return UICollectionViewCell()
    }
    
    func setCollectionView(){
        priorityCollectionView.delegate = self
        priorityCollectionView.dataSource = self
        nearCollectionView.delegate = self
        nearCollectionView.dataSource = self
        priorityCollectionView.register(UINib(nibName: PriorityCollectionViewCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: PriorityCollectionViewCell.identifierCell)
        nearCollectionView.register(UINib(nibName: NearCollectionViewCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: NearCollectionViewCell.identifierCell)
    }
}
