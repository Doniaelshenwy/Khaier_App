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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(false)
        setCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeRequest()
    }
    
    func homeRequest() {
        apiRequest.homeRequest { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
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
    
    func moveToSearchVC(){
        let vc = SearchViewController()
         push(vc: vc)
    }
    
    func moveToBookmarkVC(){
        let vc = BookmarkViewController()
        push(vc: vc)
    }
    
    func moveToCategoriesVC(){
        let vc = CategoriesViewController()
        push(vc: vc)
    }
    
    func moveToMedineCategoriesVC(){
        let vc = OneCategoryViewController()
        vc.titleNavigation = "أدوية"
        push(vc: vc)
    }
    
    func moveToFoodCategoriesVC(){
        let vc = OneCategoryViewController()
        vc.titleNavigation = "طعام"
        push(vc: vc)
    }
    
    func moveToClothesCategoriesVC(){
        let vc = OneCategoryViewController()
        vc.titleNavigation = "ملابس"
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


