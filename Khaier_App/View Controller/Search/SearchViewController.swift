//
//  SearchViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 18/02/2023.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var resultSearchLabel: UILabel!
    @IBOutlet weak var searchCollectionView: UICollectionView!
    
    var searchArray: [PriorityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        removeBorderTextField(textFields: [searchTextField])
        setCollectionView()
        setDataOfSearchArray()
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func setDataOfSearchArray(){
        searchArray = [
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            PriorityModel(image: "casePriority", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }

    @IBAction func backToHomeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func emptySearchTextField(_ sender: Any) {
    }
}
