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
//        setDataOfPriorityArray()
//        setDataOfNearArray()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        homeRequest()
//        helloNameLabel.text = "اهلا \(UserDefault.getUsername()) 👋"
//        titleLabel.text = UserDefault.getCity() + UserDefault.getRegion()
    }
    
    func homeRequest() {
        apiRequest.homeRequest { response in
            switch response {
            case .success(let data):
                self.helloNameLabel.text = "اهلا \(data?.user?.name) 👋"
                self.titleLabel.text = data?.user?.address
                print(data?.cases?.count)
                print(data?.cases)
                if let cases = data?.cases, let nearCharities = data?.charities{
                    self.priorityArray = cases
                    self.nearArray = nearCharities
                } else {
                    print("error in data")
                }
            case .failure(_):
                break
            }
        }
    }

//    func setDataOfPriorityArray(){
//        priorityArray = [
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
//            CaseDonationModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
//        ]
//    }
//
//    func setDataOfNearArray(){
//        nearArray = [
//        CharityModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
//        CharityModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخييير"),
//        CharityModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
//        CharityModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخييير"),
//        CharityModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
//        CharityModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير")
//        ]
//    }
    
    func moveToSearchVC(){
        let vc = SearchViewController()
//        vc.modalPresentationStyle = .custom
//        vc.modalTransitionStyle = .crossDissolve
//        present(vc, animated: true)
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


