//
//  OneCategoryViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit
import SkeletonView

class OneCategoryViewController: UIViewController {

    @IBOutlet weak var oneCategoryCollectionView: UICollectionView!
    @IBOutlet weak var navigationTitleLabel: UILabel!
    
    private var id: Int
    private var type: String
    private var categoryArray: [Case] = []
    private let apiRequest: CategoriesRequestProtocol = CategoriesRequest()
    
    init(id: Int, type: String) {
        self.id = id
        self.type = type
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        navigationTitleLabel.text = type
        setOneCategoryCollectionView()
        getCategories()
    }
    
    private func getCategories() {
        SkeletonViewManager.setSkelton(for: [oneCategoryCollectionView])
        apiRequest.getCategorys(id: id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let data = data?.cases {
                    SkeletonViewManager.hideSkelton(for: [self.oneCategoryCollectionView])
                    self.categoryArray = data
                    self.oneCategoryCollectionView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
    @IBAction func backButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
}

extension OneCategoryViewController: SkeletonCollectionViewDelegate, SkeletonCollectionViewDataSource {
    
    private func setOneCategoryCollectionView(){
        oneCategoryCollectionView.dataSource = self
        oneCategoryCollectionView.delegate = self
        oneCategoryCollectionView.register(cells: [BookmarkDonationCollectionViewCell.self])
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> SkeletonView.ReusableCellIdentifier {
        return BookmarkDonationCollectionViewCell.identifierCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookmarkDonationCollectionViewCell.identifierCell, for: indexPath) as! BookmarkDonationCollectionViewCell
        cell.setDonationData(donation: categoryArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DonationInViewController(id: categoryArray[indexPath.row].id ?? 0)
        push(vc: vc)
    }
}

extension OneCategoryViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 160)
    }
}
