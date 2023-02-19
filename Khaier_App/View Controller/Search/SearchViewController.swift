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
    @IBOutlet weak var filterButtonConstrain: UIButton!
    
    @IBOutlet weak var resultSearchHeightLabelConstrain: NSLayoutConstraint!
    var searchArray: [PriorityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        removeBorderTextField(textFields: [searchTextField])
        setCollectionView()
        setDataOfSearchArray()
        self.tabBarController?.tabBar.isHidden = true
        filterButtonConstrain.isHidden = true
        searchTextField.delegate = self
        hideLabel(heightConstrain: resultSearchHeightLabelConstrain, repeatLabel: resultSearchLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resultSearchLabel.text = "النتائج البحث(\(searchArray.count))"
    }
    
    func setDataOfSearchArray(){
        searchArray = [
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 60),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 20),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 80),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 100),
            PriorityModel(image: "caseSearch", title: "ساعد ساره في العلاج..", typeDonation: "أدوية", remainDays: "11", accessRatio: 10)
        ]
    }

    @IBAction func backToHomeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func emptySearchTextField(_ sender: Any) {
        searchTextField.text = ""
    }
    
    @IBAction func filterAddressButton(_ sender: Any) {
    }
}

extension SearchViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if searchTextField.text == ""{
            filterButtonConstrain.isHidden = true
            hideLabel(heightConstrain: resultSearchHeightLabelConstrain, repeatLabel: resultSearchLabel)
        } else {
            showLabel(heightConstrain: resultSearchHeightLabelConstrain, repeatLabel: resultSearchLabel)
            filterButtonConstrain.isHidden = false
        }
    }
}
