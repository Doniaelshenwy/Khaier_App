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
    let apiRequest: ProfileAPIProtocol = ProfileAPI()
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setDelegateTextField()
        setSecurePassword()
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: oldPasswordInvalidHeightLabel, invalidLabel: oldPasswordInvalidLabel)
        hideLabel(heightInvalidLabel: newPasswordInvalidheightLabel, invalidLabel: newPasswordInvalidLabel)
        hideLabel(heightInvalidLabel: confirmNewPasswordInvalidheightLabel, invalidLabel: confirmNewPasswordInvalidLabel)
    }
    
    func setSecurePassword() {
        secureOldPasswordTextField = SecureTextField(button: isEyeOldPassword, textField: oldPasswordTextField)
        secureNewPasswordTextField = SecureTextField(button: isEyeNewPassword, textField: newPasswordTextField)
        secureConfirmNewPasswordTextField = SecureTextField(button: isEyeConfirmNewPassword, textField: confirmNewPasswordTextField)
    }
    
    private func updateProfilePasswordRequest(userId: Int, model: UpdateProfilePasswordRequestModel) {
        apiRequest.updateProfilePasswordRequest(id: userId, model: model) { [weak self] response in
            guard let self = self else { return }
            print(userId)
            switch response {
            case .success(let data):
                if let password = data?.errors?.password?[0]{
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: password)
                } else if let oldPassword = data?.errors?.oldPassword?[0]{
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: oldPassword)
                }
                else if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    self.pop(isTabBarHide: false)
                }
            case .failure(_):
                break
            }
        }
    }
    
    func checkFillDataOfTextField(){
        guard let oldPassword = oldPasswordTextField.text,
              !(oldPassword.isEmpty)  else {
            checkViewIsEmpty(view: oldPasswordView,
                             height: oldPasswordInvalidHeightLabel,
                             label: oldPasswordInvalidLabel)
            return
        }
        guard let newPassword = newPasswordTextField.text,
              !(newPassword.isEmpty) else {
            checkViewIsEmpty(view: newPasswordView,
                             height: newPasswordInvalidheightLabel,
                             label: newPasswordInvalidLabel)
            return
        }
        guard let confirmNewPassword = confirmNewPasswordTextField.text, !(confirmNewPassword.isEmpty) else {
            checkViewIsEmpty(view: confirmNewPasswordView,
                             height: confirmNewPasswordInvalidheightLabel,
                             label: confirmNewPasswordInvalidLabel)
            return
        }
        let model = UpdateProfilePasswordRequestModel(oldPassword: oldPassword,
                                                      password: newPassword,
                                                      passwordConfirmation: confirmNewPassword)
        updateProfilePasswordRequest(userId: userId, model: model)
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
