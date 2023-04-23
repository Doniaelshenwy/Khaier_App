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
    @IBOutlet weak var addressTextField: UITextField!
    
    var passwordSecureTextField: SecureTextField?
    var confirmPasswordSecureTextField: SecureTextField?
    var passwordVisable = true
    var confirmPasswordVisable = true
    var isRemember = false
    let pickerView = UIPickerView()
    let apiRequest: AuthAPIProtocol = AuthAPI()
    var phone: String = ""
    
    let data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateTextField()
        isHiddeninvalidLabel(for: [userNameInvalidLabel, nameInvalidLabel, addressInvalidLabel, passwordInvalidLabel, confirmPasswordInvalidLabel])
        setZeroHeightLabel(for: [userNameInvalidHeightConstrain, nameInvalidHeightConstrain, addressInvalidConstrain, passwordInvalidHeightConstrain, confirmPasswordInvalidHeightConstrain])
        passwordSecureTextField = SecureTextField(button: eyeBtnConstrain, textField: passwordTextField)
        confirmPasswordSecureTextField = SecureTextField(button: confirmEyeBtnConstrain, textField: confirmPasswordTextField)
        removeBorderTextField(textFields: [passwordTextField, confirmPasswordTextField])
        setupPickerView()
    }
    
    func moveToHomeVC(){
        let vc = TabBarController()
        push(vc: vc)
    }
    
    func registerRequest(model: RegisterRequestModel) {
        apiRequest.registerRequest(model: model) { [weak self] response in
            switch response{
            case .success(let data):
                ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم انشاء حساب جديد👏🏻")
                UserDefault.saveUserName(data?.user?.username ?? "")
                UserDefault.saveAddress(data?.user?.address ?? "")
                self?.moveToHomeVC()
            case .failure(_):
                break
            }
        }
    }

    @IBAction func showHiddenPasswordBtn(_ sender: Any) {
        passwordSecureTextField?.checkPasswordVisiable(visable: &passwordVisable)
    }
    
    @IBAction func showHiddenConfirmPasswordBtn(_ sender: Any) {
        confirmPasswordSecureTextField?.checkPasswordVisiable(visable: &confirmPasswordVisable)
    }
    @IBAction func cityView(_ sender: Any) {
//        DropDownList.shared.data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
//        DropDownList.shared.setupDropDownList(view: addressView, label: cityLabel)
//        checkAddressView(cityLabel: cityLabel, view: addressView, label: addressInvalidLabel, height: addressInvalidConstrain)
//        DropDownList.shared.showDropDownList()
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
        guard let address = addressTextField.text, address != "اختر المدينة و المنطقة" else {
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
            if password == confirmPassword {
                let model = RegisterRequestModel(userName: userName, name: name, phone: phone , password: password, address: address)
                registerRequest(model: model)
            } else {
                ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "يجب ان تكون كلمتي السر متطابقتين")
            }
        }
    }
}

extension AccountViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPickerView() {
        addressTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        addressTextField.inputView = pickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        addressTextField.text = data[row]
        addressTextField.resignFirstResponder()
        setAppColorView(addressView)
    }
    
}
