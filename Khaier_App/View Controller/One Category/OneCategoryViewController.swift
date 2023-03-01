//
//  OneCategoryViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit

class OneCategoryViewController: UIViewController {

    @IBOutlet weak var oneCategoryCollectionView: UICollectionView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    
    var titleNavigation: String = ""
    var oneCategoryArray: [PriorityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        navigationTitleLabel.text = titleNavigation
        setOneCategoryCollectionView()
        setDataOfOneCategoryArray()
    }
    
    func setDataOfOneCategoryArray() {
        oneCategoryArray = [
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }

    @IBAction func backButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
}

extension OneCategoryViewController: CollectionViewConfig {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return oneCategoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkDonationCollectionViewCell.identifierCell, for: indexPath) as! BookmarkDonationCollectionViewCell
        cell.setDonationData(donation: oneCategoryArray[indexPath.row])
        return cell
    }
    
    func setOneCategoryCollectionView(){
        oneCategoryCollectionView.dataSource = self
        oneCategoryCollectionView.delegate = self
        oneCategoryCollectionView.register(cells: [BookmarkDonationCollectionViewCell.self])
    }
    
}

extension OneCategoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
    
}
