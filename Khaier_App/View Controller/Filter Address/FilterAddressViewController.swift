//
//  FilterAddressViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

class FilterAddressViewController: UIViewController {

    @IBOutlet weak var checkAddressBoxButton: UIButton!
    @IBOutlet weak var addressViewConstrain: UIControl!
    @IBOutlet weak var addressLabel: UILabel!
    
    var isRemember = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // function check if user choose location or not
    func checkAddressView(addressLabel: UILabel, view: UIView){
        if addressLabel.text == "اختر المدينة و المنطقة" {
            setGrayColorView(view)
        } else {
            setAppColorView(view)
        }
    }

    // when user press x button dismiss screen and move to searchVC
    @IBAction func closeFilterAddressView(_ sender: Any) {
        dismiss(animated: true)
    }
    
    // address uicontrol when press view, user can choose location
    @IBAction func addressView(_ sender: Any) {
        DropDownList.shared.data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
        DropDownList.shared.setupDropDownList(view: addressViewConstrain, label: addressLabel)
        checkAddressView(addressLabel: addressLabel, view: addressViewConstrain)
        DropDownList.shared.showDropDownList()
    }
    
    // when user check my location, result of search is determined user's location
    @IBAction func checkYourLocationBoxButton(_ sender: Any) {
        checkBoxIsAccept(isRemember: &isRemember, button: checkAddressBoxButton)
    }
}


