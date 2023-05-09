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
    var oneCategoryArray: [Case] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        navigationTitleLabel.text = titleNavigation
        setOneCategoryCollectionView()
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
