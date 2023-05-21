//
//  EditProfileViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 11/03/2023.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameInvalidLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityInvalidLabel: UILabel!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var regionInvalidLabel: UILabel!
    @IBOutlet weak var nameHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var cityHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var regionView: UIView!
    @IBOutlet weak var regionHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var phoneTextField: UITextField!
    
    private let cityPickerView = UIPickerView()
    private let regionPickerView = UIPickerView()
    var cityData : [City] = []
    var regionData : [District] = []
    let apiRequest: ProfileAPIProtocol = ProfileAPI()
    var cityId = 0
    var regionId = 0
    var userId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setupPickerView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showProfileDataRequest()
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: nameHeightInvalidLabel, invalidLabel: nameInvalidLabel)
        hideLabel(heightInvalidLabel: cityHeightInvalidLabel, invalidLabel: cityInvalidLabel)
        hideLabel(heightInvalidLabel: regionHeightInvalidLabel, invalidLabel: regionInvalidLabel)
    }
    
   private func showProfileDataRequest() {
        apiRequest.editProfileRequest { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                guard let unwrappedData = data else { return }
                self.cityData = unwrappedData.cities ?? []
                self.regionData = unwrappedData.districts ?? []
                self.nameTextField.text = unwrappedData.user?.name
                self.phoneTextField.text = unwrappedData.user?.phoneNumber
                self.cityTextField.text = unwrappedData.address?.city
                self.regionTextField.text = unwrappedData.address?.district
                self.profileImage.setImageKF(urlImage: unwrappedData.user?.thumbnail ?? "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
            case .failure(_):
                break
            }
        }
    }
    
    private func updateProfileDataRequest(userId: Int, model: UpdateProfileRequestModel) {
        apiRequest.updateProfileRequest(id: userId, model: model) { [weak self] response in
            guard let self = self else { return }
            print(response)
            switch response {
            case .success(let data):
                if let message = data?.message {
                    print("sucesss")
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    self.pop(isTabBarHide: false)
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "error")
                }
            case .failure(_):
                break
            }
        }
    }
    
    func setData() {
        guard let name = nameTextField.text, name != "" else {
            checkTextFieldIsEmpty(textField: nameTextField, height: nameHeightInvalidLabel, label: nameInvalidLabel)
            return
        }
        guard let city = cityTextField.text, city != "اختر المدينة" else {
            checkViewIsEmpty(view: cityView, height: cityHeightInvalidLabel, label: cityInvalidLabel)
            return
        }
        guard let region = regionTextField.text, region != "اختر المنطقة" else {
            checkViewIsEmpty(view: regionView, height: regionHeightInvalidLabel, label: regionInvalidLabel)
            return
        }
        let model = UpdateProfileRequestModel(name: name, cityId: cityId, districtId: regionId, thumbnail: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")
        updateProfileDataRequest(userId: userId, model: model)
    }

    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        setData()
    }
    
    
    @IBAction func openGalleryButton(_ sender: Any) {
        print("open")
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
}

extension EditProfileViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: nameTextField, label: nameInvalidLabel, height: nameHeightInvalidLabel)
        checkCityView(textField: cityTextField, view: cityView, label: cityInvalidLabel, height: cityHeightInvalidLabel)
        checkRegionView(textField: regionTextField, view: regionView, label: regionInvalidLabel, height: regionHeightInvalidLabel)
    }
    
    func setTextFieldDelegate() {
        let textField = [nameTextField, cityTextField, regionTextField]
        textField.forEach { $0?.delegate = self }
    }
}


extension EditProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPickerView() {
        [cityTextField, regionTextField].forEach({ $0?.delegate = self })
        [cityPickerView, regionPickerView].forEach({$0.delegate = self })
        [cityPickerView, regionPickerView].forEach({$0.dataSource = self })
        cityTextField.inputView = cityPickerView
        regionTextField.inputView = regionPickerView
        setTextFieldImage(nameImage: "down", textField: cityTextField)
        setTextFieldImage(nameImage: "down", textField: regionTextField)
    }
    
    private func setTextFieldImage(nameImage: String, textField: UITextField) {
        let image = UIImageView()
        image.image = UIImage(named: nameImage)
        textField.leftViewMode = .always
        textField.leftView = image
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
            setAppColorView(cityView)
        case regionPickerView:
            regionTextField.text = regionData[row].name
            regionTextField.resignFirstResponder()
            regionId = regionData[row].id
            setAppColorView(regionView)
        default:
            break
        }
    }
}

extension EditProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            profileImage.image = image
        }
        picker.dismiss(animated: true, completion: nil)
      
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
