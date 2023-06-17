//
//  HomeViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/02/2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var helloNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priorityCollectionView: UICollectionView!
    @IBOutlet weak var nearCollectionView: UICollectionView!
    
    var priorityArray: [Case] = []
    var nearArray: [Charity] = []
    let apiRequest: DataAPIProtocol = DataAPI()
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(false)
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeRequest(withSkeleton: true)
    }
    
    func homeRequest(withSkeleton: Bool) {
        if withSkeleton {
            SkeletonViewManager.setSkelton(for: [priorityCollectionView, nearCollectionView])
        }
        
        apiRequest.homeRequest() { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                SkeletonViewManager.hideSkelton(for: [self.priorityCollectionView, self.nearCollectionView])
                self.helloNameLabel.text = "اهلا \(data?.user?.name ?? "") 👋"
                self.titleLabel.text = data?.user?.address ?? ""
                if let cases = data?.cases, let nearCharities = data?.charities{
                    self.priorityArray = cases
                    self.nearArray = nearCharities
                    self.priorityCollectionView.reloadData()
                    self.nearCollectionView.reloadData()
                }
            case .failure(_):
                break
            }
        }
    }
    
    
    func moveToSearchVC() {
         push(vc: SearchViewController())
    }
    
    func moveToBookmarkVC() {
        push(vc: BookmarkViewController())
    }
    
    func moveToCategoriesVC() {
        push(vc: CategoriesViewController())
    }
    
    func moveToMedineCategoriesVC() {
        let vc = OneCategoryViewController(id: 3, type: "أدوية")
        push(vc: vc)
    }
    
    func moveToFoodCategoriesVC() {
        let vc = OneCategoryViewController(id: 2, type: "طعام")
        push(vc: vc)
    }
    
    func moveToClothesCategoriesVC() {
        let vc = OneCategoryViewController(id: 1, type: "ملابس")
        push(vc: vc)
    }
  
    @IBAction func bookmarkButton(_ sender: Any) {
        moveToBookmarkVC()
    }
    
    @IBAction func medecineView(_ sender: Any) {
        moveToMedineCategoriesVC()
    }
    
    @IBAction func foodView(_ sender: Any) {
        moveToFoodCategoriesVC()
    }
    
    @IBAction func clothesView(_ sender: Any) {
        moveToClothesCategoriesVC()
    }
    
    @IBAction func allView(_ sender: Any) {
        moveToCategoriesVC()
    }
    
    @IBAction func medicineButton(_ sender: Any) {
        moveToMedineCategoriesVC()
    }
    @IBAction func searchView(_ sender: Any) {
        moveToSearchVC()
    }
    
    @IBAction func foodButton(_ sender: Any) {
        moveToFoodCategoriesVC()
    }
    
    @IBAction func clothesButton(_ sender: Any) {
        moveToClothesCategoriesVC()
    }
    
    @IBAction func allButton(_ sender: Any) {
        moveToCategoriesVC()
    }
}
