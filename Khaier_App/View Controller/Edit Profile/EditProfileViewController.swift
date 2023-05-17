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
    
    private let pickerView = UIPickerView()
    
    let data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setupPickerView()
        setTextFieldImage(nameImage: "down")
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: nameHeightInvalidLabel, invalidLabel: nameInvalidLabel)
        hideLabel(heightInvalidLabel: cityHeightInvalidLabel, invalidLabel: cityInvalidLabel)
        hideLabel(heightInvalidLabel: regionHeightInvalidLabel, invalidLabel: regionInvalidLabel)
    }

    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
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
        
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم تعديل البيانات بنجاح")
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
        cityTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        cityTextField.inputView = pickerView
    }
    
    private func setTextFieldImage(nameImage: String) {
        let image = UIImageView()
        image.image = UIImage(named: nameImage)
        cityTextField.leftViewMode = .always
        cityTextField.leftView = image
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
        cityTextField.text = data[row]
        cityTextField.resignFirstResponder()
        setAppColorView(cityView)
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
