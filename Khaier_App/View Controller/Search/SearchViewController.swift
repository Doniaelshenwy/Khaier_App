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
    
   
    @IBOutlet weak var emptyButton: UIButton!
    var searchArray: [PriorityModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setCollectionView()
        setDataOfSearchArray()
        filterButtonConstrain.isHidden = true
        emptyButton.isHidden = false
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
    
    func moveToFillterAddressVC(){
        let vc = FilterAddressViewController(delegate: self)
        vc.modalPresentationStyle = .custom
        present(vc, animated: true, completion: nil)
    }

    @IBAction func backToHomeButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
    @IBAction func emptyTextFiledButton(_ sender: Any) {
        searchTextField.text = ""
    }
    
    @IBAction func filterAddressButton(_ sender: Any) {
        moveToFillterAddressVC()
    }
    
}

extension SearchViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if searchTextField.text == ""{
            filterButtonConstrain.isHidden = true
            emptyButton.isHidden = false
            hideLabel(heightConstrain: resultSearchHeightLabelConstrain, repeatLabel: resultSearchLabel)
        } else {
            showLabel(heightConstrain: resultSearchHeightLabelConstrain, repeatLabel: resultSearchLabel)
            filterButtonConstrain.isHidden = false
            emptyButton.isHidden = true
        }
    }
    
}

extension SearchViewController: AddressFilterationProtocol {
    
    func passFilterationAddress(address: String) {
        print("address = \(address)")
    }
    
}
