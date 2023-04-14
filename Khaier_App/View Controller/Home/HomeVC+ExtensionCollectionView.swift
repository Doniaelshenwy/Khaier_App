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
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == priorityCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
            cell.setCaseData(priority: priorityArray[indexPath.row])
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharityCollectionViewCell.identifierCell, for: indexPath) as! CharityCollectionViewCell
            cell.setCharityData(near: nearArray[indexPath.row])
            return cell
        }
    }
    
    func setCollectionView(){
        [priorityCollectionView, nearCollectionView].forEach { $0?.delegate = self }
        [priorityCollectionView, nearCollectionView].forEach { $0?.dataSource = self }
        priorityCollectionView.register(cells: [DonationCaseCollectionViewCell.self])
        nearCollectionView.register(cells: [CharityCollectionViewCell.self])
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case priorityCollectionView:
            return CGSize(width: 220, height: 268)
        case nearCollectionView:
            return CGSize(width: 220, height: 244)
        default:
            return CGSize(width: 0, height: 0)
        }
    }
    
}
