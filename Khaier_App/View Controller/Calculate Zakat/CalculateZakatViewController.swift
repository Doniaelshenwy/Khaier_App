//
//  CalculateZakatViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 07/03/2023.
//

import UIKit

class CalculateZakatViewController: UIViewController {

    @IBOutlet weak var enterAmountTextField: UITextField!
    @IBOutlet weak var enterAmountInvalidLabel: UILabel!
    @IBOutlet weak var enterAmountInvalidHeightLabel: NSLayoutConstraint!
    
    var zakatAmount = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        enterAmountTextField.delegate = self
        hideLabel(heightInvalidLabel: enterAmountInvalidHeightLabel, invalidLabel: enterAmountInvalidLabel)
    }
    
    func moveToInformationZakatVC(){
        let vc = InformationZakatViewController()
        customPresent(vc, animated: false)
    }
    
    func moveToZakatValueVC(){
        let vc = ZakatValueViewController(delegate: self)
        vc.zakatAmount = zakatAmount
        customPresent(vc, animated: false)
    }
    
    func checkEnterAmountData() {
        guard let amount = enterAmountTextField.text, amount != "" else {
            checkTextFieldIsEmpty(textField: enterAmountTextField, height: enterAmountInvalidHeightLabel, label: enterAmountInvalidLabel)
            return
        }
        zakatAmount = String(Double(amount)! / 40)
        moveToZakatValueVC()
    }

    @IBAction func CalculateButton(_ sender: Any) {
        checkEnterAmountData()
    }
    
    @IBAction func imformationZakatButton(_ sender: Any) {
        moveToInformationZakatVC()
    }
    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
}

extension CalculateZakatViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: enterAmountTextField, label: enterAmountInvalidLabel, height: enterAmountInvalidHeightLabel)
    }
    
}

extension CalculateZakatViewController: DonateNowProtocol {
    
    func movetoHomeVCFromZakatValue() {
        moveToHomeVC()
    }
    
}
