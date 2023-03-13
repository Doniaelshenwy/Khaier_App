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
    @IBOutlet weak var nameHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var phoneInvalidLabel: UILabel!
    @IBOutlet weak var phoneHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var addressInvalidLabel: UILabel!
    @IBOutlet weak var chooseAddressTextField: UITextField!
    @IBOutlet weak var addressView: UIView!
    @IBOutlet weak var addressHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var profileImage: UIImageView!
    
    private let pickerView = UIPickerView()
    var maxLength = 11
    
    let data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setupPickerView()
        setTextFieldImage(nameImage: "arrow-down")
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: nameHeightInvalidLabel, invalidLabel: nameInvalidLabel)
        hideLabel(heightInvalidLabel: phoneHeightInvalidLabel, invalidLabel: phoneInvalidLabel)
        hideLabel(heightInvalidLabel: addressHeightInvalidLabel, invalidLabel: addressInvalidLabel)
    }

    @IBAction func backToProfileVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
    func setData() {
        guard let name = nameTextField.text, name != "" else {
            checkTextFieldIsEmpty(textField: nameTextField, height: nameHeightInvalidLabel, label: nameInvalidLabel)
            return
        }
        guard let phone = phoneTextField.text, phone != "" else {
            checkTextFieldIsEmpty(textField: phoneTextField, height: phoneHeightInvalidLabel, label: phoneInvalidLabel)
            return
        }
        guard let address = chooseAddressTextField.text, address != "اختر المدينة و المنطقة" else {
            checkViewIsEmpty(view: addressView, height: addressHeightInvalidLabel, label: addressInvalidLabel)
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
        checkColorBoderOfTextField(textfield: phoneTextField, label: phoneInvalidLabel, height: phoneHeightInvalidLabel)
        checkChooseAddressView(textField: chooseAddressTextField, view: addressView, label: addressInvalidLabel, height: addressHeightInvalidLabel)
    }
    
    func checkChooseAddressView(textField: UITextField, view: UIView, label: UILabel, height: NSLayoutConstraint) {
        if textField.text == "اختر المدينة و المنطقة" {
            setGrayColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        } else {
            setAppColorView(view)
            hideLabel(heightInvalidLabel: height, invalidLabel: label)
        }
    }
    
    func setTextFieldDelegate() {
        let textField = [nameTextField, phoneTextField, chooseAddressTextField]
        textField.forEach { $0?.delegate = self }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == phoneTextField{
          let currentString: NSString = textField.text! as NSString
          let newString: NSString =  currentString.replacingCharacters(in: range, with: string) as NSString
          return newString.length <= maxLength
        }
        return true
      }
    
}


extension EditProfileViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPickerView() {
        chooseAddressTextField.delegate = self
        pickerView.delegate = self
        pickerView.dataSource = self
        chooseAddressTextField.inputView = pickerView
    }
    
    private func setTextFieldImage(nameImage: String) {
        let image = UIImageView()
        image.image = UIImage(named: nameImage)
        chooseAddressTextField.leftViewMode = .always
        chooseAddressTextField.leftView = image
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
        chooseAddressTextField.text = data[row]
        chooseAddressTextField.resignFirstResponder()
        setAppColorView(addressView)
        setTextFieldImage(nameImage: "down")
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
