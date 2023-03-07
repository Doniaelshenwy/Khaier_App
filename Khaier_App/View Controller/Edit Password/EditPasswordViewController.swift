//
//  EditPasswordViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 05/03/2023.
//

import UIKit

class EditPasswordViewController: UIViewController {

    @IBOutlet weak var oldPasswordTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    @IBOutlet weak var isEyeOldPassword: UIButton!
    @IBOutlet weak var isEyeNewPassword: UIButton!
    @IBOutlet weak var isEyeConfirmNewPassword: UIButton!
    @IBOutlet weak var oldPasswordInvalidLabel: UILabel!
    @IBOutlet weak var oldPasswordInvalidHeightLabel: NSLayoutConstraint!
    @IBOutlet weak var newPasswordInvalidLabel: UILabel!
    @IBOutlet weak var newPasswordInvalidheightLabel: NSLayoutConstraint!
    @IBOutlet weak var confirmNewPasswordInvalidLabel: UILabel!
    @IBOutlet weak var confirmNewPasswordInvalidheightLabel: NSLayoutConstraint!
    @IBOutlet weak var oldPasswordView: UIView!
    @IBOutlet weak var newPasswordView: UIView!
    @IBOutlet weak var confirmNewPasswordView: UIView!
    
    var isOldpasswordVisable = true
    var isNewpasswordVisable = true
    var isConfirmNewPasswordVisable = true
    var secureOldPasswordTextField: SecureTextField?
    var secureNewPasswordTextField: SecureTextField?
    var secureConfirmNewPasswordTextField: SecureTextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setDelegateTextField()
        setSecurePassword()
    }
    
    func hideInvalidLabel() {
        hideLabel(heightConstrain: oldPasswordInvalidHeightLabel, repeatLabel: oldPasswordInvalidLabel)
        hideLabel(heightConstrain: newPasswordInvalidheightLabel, repeatLabel: newPasswordInvalidLabel)
        hideLabel(heightConstrain: confirmNewPasswordInvalidheightLabel, repeatLabel: confirmNewPasswordInvalidLabel)
    }
    
    func setSecurePassword() {
        secureOldPasswordTextField = SecureTextField(button: isEyeOldPassword, textField: oldPasswordTextField)
        secureNewPasswordTextField = SecureTextField(button: isEyeNewPassword, textField: newPasswordTextField)
        secureConfirmNewPasswordTextField = SecureTextField(button: isEyeConfirmNewPassword, textField: confirmNewPasswordTextField)
    }
    
    func checkFillDataOfTextField(){
        guard let oldPassword = oldPasswordTextField.text, oldPassword != ""  else {
            checkViewIsEmpty(view: oldPasswordView, height: oldPasswordInvalidHeightLabel, label: oldPasswordInvalidLabel)
            return
        }
        guard let newPassword = newPasswordTextField.text, newPassword != "" else {
            checkViewIsEmpty(view: newPasswordView, height: newPasswordInvalidheightLabel, label: newPasswordInvalidLabel)
            return
        }
        guard let confirmNewPassword = confirmNewPasswordTextField.text, confirmNewPassword != "" else {
            checkViewIsEmpty(view: confirmNewPasswordView, height: confirmNewPasswordInvalidheightLabel, label: confirmNewPasswordInvalidLabel)
            return
        }
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم تغيير كلمة المرور")
    }
    
    @IBAction func isEyeOldPassword(_ sender: Any) {
        secureOldPasswordTextField?.checkPasswordVisiable(visable: &isOldpasswordVisable)
    }
    
    @IBAction func isEyeNewPassword(_ sender: Any) {
        secureNewPasswordTextField?.checkPasswordVisiable(visable: &isNewpasswordVisable)
    }
    
    @IBAction func isEyeConfirmNewPassword(_ sender: Any) {
        secureConfirmNewPasswordTextField?.checkPasswordVisiable(visable: &isConfirmNewPasswordVisable)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        checkFillDataOfTextField()
    }

    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
}
