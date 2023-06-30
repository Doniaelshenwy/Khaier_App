//
//  ResetPasswordViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/02/2023.
//

import UIKit

class ResetPasswordViewController: UIViewController, ChangePasswordProtocol {
    
    @IBOutlet weak var passwordView: UIView!
    @IBOutlet weak var confirmPasswordView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var passwordConfirmLabel: UILabel!
    @IBOutlet weak var passwordConfirmHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var showHiddenPasswordConstrainBtn: UIButton!
    @IBOutlet weak var showHiddenConfirmPasswordConstrainBtn: UIButton!
    
    var passwordVisable = true
    var confirmPasswordVisable = true
    var securePasswordTextField: SecureTextField?
    var secureConfirmPasswordTextField: SecureTextField?
    var phone: String = ""
    let apiRequest: AuthAPIProtocol = AuthAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateTextField()
        isNavigationHidden(true)
        setZeroHeightLabel(for: [passwordErrorHeightConstrain, passwordConfirmHeightConstrain])
        isHiddeninvalidLabel(for: [passwordErrorLabel, passwordConfirmLabel])
        securePasswordTextField = SecureTextField(button: showHiddenPasswordConstrainBtn, textField: passwordTextField)
        secureConfirmPasswordTextField = SecureTextField(button: showHiddenConfirmPasswordConstrainBtn, textField: confirmPasswordTextField)
    }
    
    func updatePasswordRequest(model: AuthRequestModel) {
        apiRequest.updatePasswordRequest(model: model) { response in
            switch response {
            case .success(let data):
                if let error = data?.errors?.password?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error)
                } else {
                    self.moveToChangePasswordVC()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func moveToChangePasswordVC() {
        let vc = ChangePasswordViewController(delegate: self)
        present(vc, animated: true, completion: nil)
    }
    
    func checkTextField(){
        guard let password = passwordTextField.text, password != "" else {
            checkViewIsEmpty(view: passwordView, height: passwordErrorHeightConstrain, label: passwordErrorLabel)
            return
        }
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword != "" else {
            checkViewIsEmpty(view: confirmPasswordView, height: passwordConfirmHeightConstrain, label: passwordConfirmLabel)
            return
        }
        print("password \(password), \(confirmPassword)")
        let model = AuthRequestModel(phoneNumber: phone, password: password, confirmPassword: confirmPassword)
        updatePasswordRequest(model: model)
        //moveToChangePasswordVC()
        
//        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم تغير رقم المرور")
    }

    @IBAction func showHiddenPasswordBtn(_ sender: Any) {
        securePasswordTextField?.checkPasswordVisiable(visable: &passwordVisable)
    }
    
    @IBAction func showHiddenConfirmPasswordBtn(_ sender: Any) {
        secureConfirmPasswordTextField?.checkPasswordVisiable(visable: &confirmPasswordVisable)
    }
    
    @IBAction func repeatSetPasswordBtn(_ sender: Any) {
       checkTextField()
    }
    
    func movetoLoginVCFromChangePassword() {
        moveToLoginVC()
    }
}



