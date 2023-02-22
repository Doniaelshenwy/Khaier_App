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
    
    var priorityArray: [PriorityModel] = []
    var nearArray: [NearModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        tabBarController?.tabBar.isHidden = false
        setCollectionView()
        setDataOfPriorityArray()
        setDataOfNearArray()
    }

    func setDataOfPriorityArray(){
        priorityArray = [
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }
    
    func setDataOfNearArray(){
        nearArray = [
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخييير"),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخييير"),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير"),
        NearModel(image: "charity", title: "جمعية الامل الخيرية", address: "المنصورة، الدقهلية", description: "جمعية الأمل نشأت في ظل الظروف الراهنة والصعبة كما هي حال الطــــــــــبي الخــــيري الطــــــــــبي الخــــيري الخيييير")
        ]
    }
    
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

extension HomeViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case priorityCollectionView:
            return CGSize(width: 220, height: 268)
        case nearCollectionView:
            return CGSize(width: 220, height: 244)
        default:
            break
        }
        return CGSize(width: 0, height: 0)
    }
}
