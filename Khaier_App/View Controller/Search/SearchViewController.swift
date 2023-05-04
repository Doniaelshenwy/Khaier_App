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
    @IBOutlet weak var emptyView: UIView!
    
    var searchArray: [Case] = []
    let apiRequest: DataAPIProtocol = DataAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setCollectionView()
        filterButtonConstrain.isHidden = true
        emptyButton.isHidden = false
        searchTextField.delegate = self
        hideLabel(heightInvalidLabel: resultSearchHeightLabelConstrain,
                  invalidLabel: resultSearchLabel)
        emptyView.isHidden = true
    }

    func searchRequest(search: String) {
        apiRequest.searchRequest(search: search) { response in
            switch response {
            case .success(let data):
                if let cases = data?.cases {
                    self.searchArray = cases
                    self.isHidenEmptyView()
                    self.searchCollectionView.reloadData()
                } else {
                    self.isHidenEmptyView()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func isHidenEmptyView() {
        if searchArray.count == 0 {
            emptyView.isHidden = false
        } else {
            emptyView.isHidden = true
        }
        self.resultSearchLabel.text = "النتائج البحث(\(self.searchArray.count))"
    }
    
    func moveToFillterAddressVC(){
        let vc = FilterAddressViewController(delegate: self)
        customPresent(vc, animated: false)
    }

    @IBAction func backToHomeButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
    @IBAction func emptyTextFiledButton(_ sender: Any) {
        searchTextField.text = ""
        searchArray = []
        searchCollectionView.reloadData()
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
            hideLabel(heightInvalidLabel: resultSearchHeightLabelConstrain,
                      invalidLabel: resultSearchLabel)
            emptyView.isHidden = true
            searchArray = []
        } else {
            searchRequest(search: textField.text ?? "")
            showLabel(heightConstrain: resultSearchHeightLabelConstrain,
                      repeatLabel: resultSearchLabel)
            filterButtonConstrain.isHidden = false
            emptyButton.isHidden = true
            isHidenEmptyView()
        }
        searchCollectionView.reloadData()
    }
    
}

extension SearchViewController: AddressFilterationProtocol {
    
    func passFilterationAddress(address: String) {
        print("address = \(address)")
    }
    
}
