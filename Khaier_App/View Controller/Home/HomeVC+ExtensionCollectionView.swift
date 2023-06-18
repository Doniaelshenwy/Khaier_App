//
//  HomeVC+ExtensionCollectionView.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/02/2023.
//

import UIKit
import SkeletonView

extension HomeViewController: SkeletonCollectionViewDelegate, SkeletonCollectionViewDataSource {
    
    func moveToDonationInVC() {
        let vc = DonationInViewController(id: id)
        push(vc: vc)
    }
    
    func setCollectionView(){
        [
            priorityCollectionView,
            nearCollectionView
        ]
            .forEach {
                $0?.delegate = self
                $0?.dataSource = self
            }
        priorityCollectionView.register(cells: [DonationCaseCollectionViewCell.self])
        nearCollectionView.register(cells: [CharityCollectionViewCell.self])
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        switch skeletonView {
        case priorityCollectionView:
            return DonationCaseCollectionViewCell.identifierCell
            
        case nearCollectionView:
            return CharityCollectionViewCell.identifierCell
            
        default:
            return ""
        }
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
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
        if collectionView == priorityCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DonationCaseCollectionViewCell.identifierCell, for: indexPath) as! DonationCaseCollectionViewCell
            cell.setCaseData(priority: priorityArray[indexPath.row], isHidedonationDone: true, isEnabledDonateNow: true)
            self.id = self.priorityArray[indexPath.row].id ?? 0
            //MARK: reload date after tapping on the fav button
            cell.favAction = { [weak self] in
                guard let self = self else { return }
                //self.homeRequest(withSkeleton: false)
            }
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharityCollectionViewCell.identifierCell, for: indexPath) as! CharityCollectionViewCell
            cell.setCharityData(near: nearArray[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == nearCollectionView {
            let vc = CharityProfileViewController(id: nearArray[indexPath.row].id ?? 0)
            push(vc: vc)
        } else if collectionView == priorityCollectionView {
            let vc = DonationInViewController(id: priorityArray[indexPath.row].id ?? 0)
            push(vc: vc)
        }
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
