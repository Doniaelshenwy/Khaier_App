//
//  AccountViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 08/02/2023.
//

import UIKit

class AccountViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var userNameInvalidLabel: UILabel!
    @IBOutlet weak var userNameInvalidHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var nameInvalidHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var nameInvalidLabel: UILabel!
    @IBOutlet weak var addressInvalidLabel: UILabel!
    @IBOutlet weak var addressInvalidConstrain: NSLayoutConstraint!
    @IBOutlet weak var passwordInvalidHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var passwordInvalidLabel: UILabel!
    @IBOutlet weak var checkBtnConstrain: UIButton!
    @IBOutlet weak var confirmPasswordInvalidHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var confirmPasswordInvalidLabel: UILabel!
    @IBOutlet weak var confirmEyeBtnConstrain: UIButton!
    @IBOutlet weak var eyeBtnConstrain: UIButton!
    @IBOutlet weak var addressView: UIControl!
    var passwordSecureTextField: SecureTextField?
    var confirmPasswordSecureTextField: SecureTextField?
    var passwordVisable = true
    var confirmPasswordVisable = true
    var isRemember = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateTextField()
        isHiddeninvalidLabel(for: [userNameInvalidLabel, nameInvalidLabel, addressInvalidLabel, passwordInvalidLabel, confirmPasswordInvalidLabel])
        setZeroHeightLabel(for: [userNameInvalidHeightConstrain, nameInvalidHeightConstrain, addressInvalidConstrain, passwordInvalidHeightConstrain, confirmPasswordInvalidHeightConstrain])
        passwordSecureTextField = SecureTextField(button: eyeBtnConstrain, textField: passwordTextField)
        confirmPasswordSecureTextField = SecureTextField(button: confirmEyeBtnConstrain, textField: confirmPasswordTextField)
        removeBorderTextField(textFields: [passwordTextField, confirmPasswordTextField])
        
    }

    @IBAction func showHiddenPasswordBtn(_ sender: Any) {
        passwordSecureTextField?.checkPasswordVisiable(visable: &passwordVisable)
    }
    
    @IBAction func showHiddenConfirmPasswordBtn(_ sender: Any) {
        confirmPasswordSecureTextField?.checkPasswordVisiable(visable: &confirmPasswordVisable)
    }
    @IBAction func cityView(_ sender: Any) {
        DropDownList.shared.data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
        DropDownList.shared.setupDropDownList(view: addressView, label: cityLabel)
        checkAddressView(cityLabel: cityLabel, view: addressView, label: addressInvalidLabel, height: addressInvalidConstrain)
        DropDownList.shared.showDropDownList()
    }
    
    @IBAction func checkBtn(_ sender: Any) {
        checkBoxIsAccept(isRemember: &isRemember, button: checkBtnConstrain)
    }
    
    @IBAction func createNewAccountBtn(_ sender: Any) {
        guard let userName = userNameTextField.text, userName != "" else {
            checkTextFieldIsEmpty(textField: userNameTextField, height: userNameInvalidHeightConstrain, label: userNameInvalidLabel)
            return
        }
        guard let name = nameTextField.text, name != "" else {
            checkTextFieldIsEmpty(textField: nameTextField, height: nameInvalidHeightConstrain, label: nameInvalidLabel)
            return
        }
        guard let address = cityLabel.text, address != "اختر المدينة و المنطقة" else {
            checkViewIsEmpty(view: addressView, height: addressInvalidConstrain, label: addressInvalidLabel)
            return
        }
        guard let password = passwordTextField.text, password != "" else {
            checkViewIsEmpty(view: passwordView, height: passwordInvalidHeightConstrain, label: passwordInvalidLabel)
            return
        }
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword != "" else {
            checkViewIsEmpty(view: confirmPasswordView, height: confirmPasswordInvalidHeightConstrain, label: confirmPasswordInvalidLabel)
            return
        }
        if isRemember == true{
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم انشاء حساب جديد👏🏻")
        }
    }
    
    
}
