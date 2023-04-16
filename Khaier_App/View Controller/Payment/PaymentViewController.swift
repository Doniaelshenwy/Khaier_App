//
//  PaymentViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/04/2023.
//

import UIKit

class PaymentViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var fiveButtonConstrain: UIButton!
    @IBOutlet weak var tenButtonConstrain: UIButton!
    @IBOutlet weak var twoHundredButtonConstrain: UIButton!
    @IBOutlet weak var hundredButtonConstrain: UIButton!
    @IBOutlet weak var twentyButtonConstrain: UIButton!
    @IBOutlet weak var fiftyButtonConstrain: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setTextFieldDelegate()
    }
    
    func moveToPaymentMethodVC() {
        let vc = PaymentMethodViewController()
        push(vc: vc)
    }
    
    @IBAction func continueButton(_ sender: Any) {
        moveToPaymentMethodVC()
    }
    
    func selectAmount(sender: UIButton) {
        amountTextField.text = sender.titleLabel?.text
        sender.backgroundColor = UIColor(named: "AppColor")
        sender.tintColor = .white
    }
    
    func deselectAmount() {
    let arrayButton = [fiveButtonConstrain, tenButtonConstrain, twentyButtonConstrain, hundredButtonConstrain, fiftyButtonConstrain, twoHundredButtonConstrain]
        arrayButton.forEach{$0?.backgroundColor = .white}
        arrayButton.forEach{$0?.tintColor = UIColor(named: "AppColor")}
    }
    
    @IBAction func fiveButton(_ sender: Any) {
        deselectAmount()
        selectAmount(sender: fiveButtonConstrain)
    }
    
    @IBAction func tenButton(_ sender: Any) {
        deselectAmount()
        selectAmount(sender: tenButtonConstrain)
    }
    
    @IBAction func twentyButton(_ sender: Any) {
        deselectAmount()
        selectAmount(sender: twentyButtonConstrain)
    }
    
    @IBAction func fiftyButton(_ sender: Any) {
        deselectAmount()
        selectAmount(sender: fiftyButtonConstrain)
    }
    
    @IBAction func hundredButton(_ sender: Any) {
        deselectAmount()
        selectAmount(sender: hundredButtonConstrain)
    }
    
    @IBAction func twoHundredButton(_ sender: Any) {
        deselectAmount()
        selectAmount(sender: twoHundredButtonConstrain)
    }
    
}

extension PaymentViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        deselectAmount()
    }
    
    func setTextFieldDelegate() {
        amountTextField.delegate = self
    }
    
}
