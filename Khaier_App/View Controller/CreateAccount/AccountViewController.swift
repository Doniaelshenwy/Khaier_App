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
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityView: UIControl!
    @IBOutlet weak var regionHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var regionView: UIControl!
    @IBOutlet weak var regionInvalidLabel: UILabel!
    @IBOutlet weak var regionTextField: UITextField!
    var passwordSecureTextField: SecureTextField?
    var confirmPasswordSecureTextField: SecureTextField?
    var passwordVisable = true
    var confirmPasswordVisable = true
    var isRemember = false
    let cityPickerView = UIPickerView()
    let regionPickerView = UIPickerView()
    let apiRequest: AuthAPIProtocol = AuthAPI()
    var phone: String = ""
    var cityId = 0
    var regionId = 0
    var cityData : [City] = []
    var regionData : [District] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegateTextField()
        isHiddeninvalidLabel(for: [userNameInvalidLabel, nameInvalidLabel, addressInvalidLabel, passwordInvalidLabel, confirmPasswordInvalidLabel, regionInvalidLabel])
        setZeroHeightLabel(for: [userNameInvalidHeightConstrain, nameInvalidHeightConstrain, addressInvalidConstrain, passwordInvalidHeightConstrain, confirmPasswordInvalidHeightConstrain])
        passwordSecureTextField = SecureTextField(button: eyeBtnConstrain, textField: passwordTextField)
        confirmPasswordSecureTextField = SecureTextField(button: confirmEyeBtnConstrain, textField: confirmPasswordTextField)
        removeBorderTextField(textFields: [passwordTextField, confirmPasswordTextField])
        setupPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cityRegisterRequest()
    }
    
    func registerRequest(model: RegisterRequestModel) {
        apiRequest.registerRequest(model: model) { [weak self] response in
            switch response {
            case .success(let data):
                if let error = data?.errors?.password?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error)
                } else if let error = data?.errors?.username?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error)
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم انشاء حساب جديد👏🏻")
                    UserDefault.saveUserName(data?.user?.username ?? "")
                    self?.moveToHomeVC()
                }
            case .failure(_):
                break
            }
        }
    }
    
    func cityRegisterRequest() {
        apiRequest.cityRegisterRequest { response in
            switch response {
            case .success(let data):
                guard let unwrappedData = data else { return }
                self.cityData = unwrappedData.cities
                self.regionData = unwrappedData.districts
            case .failure(_):
                print("Error Data City")
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
        guard let city = cityTextField.text, city != "اختر المدينة" else {
            checkViewIsEmpty(view: cityView, height: addressInvalidConstrain, label: addressInvalidLabel)
            return
        }
        UserDefault.saveCity(city)
        guard let region = regionTextField.text, region != "اختر المنطقة" else {
            checkViewIsEmpty(view: regionView, height: regionHeightInvalidLabel, label: regionInvalidLabel)
            return
        }
        UserDefault.saveRegion(region)
        guard let password = passwordTextField.text, password != "" else {
            checkViewIsEmpty(view: passwordView, height: passwordInvalidHeightConstrain, label: passwordInvalidLabel)
            return
        }
        guard let confirmPassword = confirmPasswordTextField.text, confirmPassword != "" else {
            checkViewIsEmpty(view: confirmPasswordView, height: confirmPasswordInvalidHeightConstrain, label: confirmPasswordInvalidLabel)
            return
        }
        if isRemember == true{
            let model = RegisterRequestModel(userName: userName, name: name, phone: phone , password: password, passwordConfirmation: confirmPassword, cityId: cityId, districtId: regionId)
            registerRequest(model: model)
            print(cityId)
        }
    }
}

extension AccountViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPickerView() {
        [cityTextField, regionTextField].forEach { $0.delegate = self }
        [cityPickerView, regionPickerView].forEach { $0.delegate = self }
        [cityPickerView, regionPickerView].forEach { $0.dataSource = self }
        cityTextField.inputView = cityPickerView
        regionTextField.inputView = regionPickerView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case cityPickerView:
            return cityData.count
        case regionPickerView:
            return regionData.filter({$0.cityID == self.cityId}).count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case cityPickerView:
            return cityData[row].name
        case regionPickerView:
            return regionData.filter({$0.cityID == cityId})[row].name
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case cityPickerView:
            cityTextField.text = cityData[row].name
            cityTextField.resignFirstResponder()
            cityId = cityData[row].id
        case regionPickerView:
            regionTextField.text = regionData[row].name
            regionTextField.resignFirstResponder()
            regionId = regionData[row].id
        default:
            break
        }
    }
    
}
