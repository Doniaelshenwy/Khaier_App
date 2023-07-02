//
//  PaymentMethodViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 16/04/2023.
//

import UIKit

class PaymentMethodViewController: UIViewController {

    @IBOutlet weak var payPalButtonConstrain: UIButton!
    @IBOutlet weak var visaButtonConstrain: UIButton!
    @IBOutlet weak var masterCardButtonConstrain: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var creditNumberTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var enterPasswordOrDateInvalidLabel: UILabel!
    @IBOutlet weak var enterCreditNumberInvalidLabel: UILabel!
    @IBOutlet weak var enterNameInvalidLabel: UILabel!
    @IBOutlet weak var enterNameHeightInvalid: NSLayoutConstraint!
    @IBOutlet weak var enterCreditNumberHeightInvalid: NSLayoutConstraint!
    @IBOutlet weak var enterPasswordOrDateHeightInvalid: NSLayoutConstraint!
    @IBOutlet weak var dateView: UIView!
    
    private let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setDatePicker()
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: enterNameHeightInvalid, invalidLabel: enterNameInvalidLabel)
        hideLabel(heightInvalidLabel: enterCreditNumberHeightInvalid, invalidLabel: enterCreditNumberInvalidLabel)
        hideLabel(heightInvalidLabel: enterPasswordOrDateHeightInvalid, invalidLabel: enterPasswordOrDateInvalidLabel)
    }
    
    func selectPaymentMethod(button: UIButton) {
        button.borderColor = UIColor(named: "AppColor")
    }
    
    func deselectPaymentMethod() {
        let paymentButtonArray = [payPalButtonConstrain, visaButtonConstrain, masterCardButtonConstrain]
        paymentButtonArray.forEach {$0?.borderColor = UIColor(named: "disapleColor")}
    }
    
    func setData() {
        guard let name = fullNameTextField.text, name != "" else {
            checkTextFieldIsEmpty(textField: fullNameTextField, height: enterNameHeightInvalid, label: enterNameInvalidLabel)
            return
        }
        guard let creditNumber = creditNumberTextField.text, creditNumber != "" else {
            checkTextFieldIsEmpty(textField: creditNumberTextField, height: enterCreditNumberHeightInvalid, label: enterCreditNumberInvalidLabel)
            return
        }
        guard let password = passwordTextField.text, password != "" else {
            checkTextFieldIsEmpty(textField: passwordTextField, height: enterPasswordOrDateHeightInvalid, label: enterPasswordOrDateInvalidLabel)
            enterPasswordOrDateInvalidLabel.text = "يرجي ادخال الرقم السري"
            return
        }
        guard let date = dateTextField.text, date != "" else {
            checkViewIsEmpty(view: dateView, height: enterPasswordOrDateHeightInvalid, label: enterPasswordOrDateInvalidLabel)
            enterPasswordOrDateInvalidLabel.text = "يرجي ادخال تاريخ انتهاء البطاقة"
            return
        }
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم تأكيد الدفع")
        moveToHomeVC()
    }
    

    @IBAction func backTOPaymentVc(_ sender: Any) {
        pop(isTabBarHide: true)
    }
    
    @IBAction func visaButton(_ sender: UIButton) {
        deselectPaymentMethod()
        selectPaymentMethod(button: visaButtonConstrain)
    }
    @IBAction func payPalButton(_ sender: UIButton) {
        deselectPaymentMethod()
        selectPaymentMethod(button: payPalButtonConstrain)
    }
    
    @IBAction func masterCardButton(_ sender: Any) {
        deselectPaymentMethod()
        selectPaymentMethod(button: masterCardButtonConstrain)
    }
    
    @IBAction func confirmPayment(_ sender: Any) {
        setData()
    }
    
}

extension PaymentMethodViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: fullNameTextField, label: enterNameInvalidLabel, height: enterNameHeightInvalid)
        checkColorBoderOfTextField(textfield: creditNumberTextField, label: enterCreditNumberInvalidLabel, height: enterCreditNumberHeightInvalid)
        checkColorBoderOfTextField(textfield: passwordTextField, label: enterPasswordOrDateInvalidLabel, height: enterPasswordOrDateHeightInvalid)
        checkColorBorderOfView(textfield: dateTextField, view: dateView, label: enterPasswordOrDateInvalidLabel, height: enterPasswordOrDateHeightInvalid)
    }
    
    func setTextFieldDelegate() {
        let textField = [fullNameTextField, creditNumberTextField, passwordTextField, dateTextField]
        textField.forEach { $0?.delegate = self }
    }
    
}

extension PaymentMethodViewController {
    
    func setDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDatePressed))
        toolbar.setItems([doneBtn], animated: true)
        dateTextField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ar")
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func doneDatePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "d MMM yyyy"
        formatter.locale = NSLocale(localeIdentifier: "ar") as Locale
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
