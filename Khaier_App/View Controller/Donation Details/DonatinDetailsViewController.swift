//
//  DonatinDetailsViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import UIKit

class DonatinDetailsViewController: UIViewController {
    
    @IBOutlet weak var descriptionDonationTextField: UITextField!
    @IBOutlet weak var quantityOfDonationTextField: UITextField!
    @IBOutlet weak var descriptionDonationInvalidLabel: UILabel!
    @IBOutlet weak var descriptionDonationHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var quantityOfDonationInvalidLabel: UILabel!
    @IBOutlet weak var quantityOfDonationHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var dateInvalidLabel: UILabel!
    @IBOutlet weak var dateHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var timeInvalidLabel: UILabel!
    @IBOutlet weak var timeHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var addressInvalidLabel: UILabel!
    @IBOutlet weak var addressHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var dateTextFiled: UITextField!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var fromTimeTextField: UITextField!
    @IBOutlet weak var addressTextFiled: UITextField!
    @IBOutlet weak var toTimeTextField: UITextField!
    @IBOutlet weak var imageDonation: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var trashView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var addImageHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var addImageInvalidLabel: UILabel!
    @IBOutlet weak var numberOfCharacterOfCommentLabel: UILabel!
    
    private let apiRequest: DonationTrackingAPIProtocol = DonationTrackingAPI()
    private let datePicker = UIDatePicker()
    private let fromTimePicker = UIDatePicker()
    private let toTimePicker = UIDatePicker()
    private var id: Int
    
    var isChooseImageDonation = false
    var maxLength = 10
    
    var imageGallery : UIImage?
    
    init(id: Int) {
        self.id = id
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setTextViewDelegate()
        setupPickerView()
        hidenImage()
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: descriptionDonationHeightInvalidLabel, invalidLabel: descriptionDonationInvalidLabel)
        hideLabel(heightInvalidLabel: quantityOfDonationHeightInvalidLabel, invalidLabel: quantityOfDonationInvalidLabel)
        hideLabel(heightInvalidLabel: dateHeightInvalidLabel, invalidLabel: dateInvalidLabel)
        hideLabel(heightInvalidLabel: timeHeightInvalidLabel, invalidLabel: timeInvalidLabel)
        hideLabel(heightInvalidLabel: addressHeightInvalidLabel, invalidLabel: addressInvalidLabel)
        hideLabel(heightInvalidLabel: addImageHeightInvalidLabel, invalidLabel: addImageInvalidLabel)
    }
    
    func hidenImage() {
        imageDonation.isHidden = true
        trashView.isHidden = true
    }
    
    func showImage() {
        imageDonation.isHidden = false
        trashView.isHidden = false
    }
    
    func moveToThanksDonationVC(){
        let vc = ThanksDonationViewController(delegate: self)
        customPresent(vc, animated: false)
    }
    
    func setData() {
        guard let description = descriptionDonationTextField.text, !description.isEmpty else {
            checkTextFieldIsEmpty(textField: descriptionDonationTextField, height: descriptionDonationHeightInvalidLabel, label: descriptionDonationInvalidLabel)
            return
        }
        guard let quantity = quantityOfDonationTextField.text, !quantity.isEmpty else {
            checkTextFieldIsEmpty(textField: quantityOfDonationTextField, height: quantityOfDonationHeightInvalidLabel, label: quantityOfDonationInvalidLabel)
            return
        }
        guard let date = dateTextFiled.text, !date.isEmpty else {
            checkViewIsEmpty(view: dateView, height: dateHeightInvalidLabel, label: dateInvalidLabel)
            return
        }
        guard let fromTime = fromTimeTextField.text, !fromTime.isEmpty else {
            checkTextFieldIsEmpty(textField: fromTimeTextField, height: timeHeightInvalidLabel, label: timeInvalidLabel)
            return
        }
        guard let toTime = toTimeTextField.text, !toTime.isEmpty else {
            checkTextFieldIsEmpty(textField: toTimeTextField, height: timeHeightInvalidLabel, label: timeInvalidLabel)
            return
        }
        guard let address = addressTextFiled.text, !address.isEmpty else {
            checkTextFieldIsEmpty(textField: addressTextFiled, height: addressHeightInvalidLabel, label: addressInvalidLabel)
            return
        }
        if isChooseImageDonation {
            let model = AddDonationRequestModel(id: id,
                                                description: description,
                                                quantity: Int(quantity) ?? 0,
                                                pickUpDate: date,
                                                pickUpStartTime: fromTime,
                                                pickUpEndTime: toTime,
                                                pickUpAddress: address)
            addDonationReques(image: imageGallery ?? UIImage(named: "photoProfile")!, model: model)
        } else {
            checkViewIsEmpty(view: imageView, height: addImageHeightInvalidLabel, label: addImageInvalidLabel)
        }
    }

    @IBAction func backToDonationIn(_ sender: Any) {
        pop(isTabBarHide: true)
    }
    
    @IBAction func deleteImageButton(_ sender: Any) {
        hidenImage()
        isChooseImageDonation = false
    }
    
    @IBAction func openGalleryButton(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func donationButton(_ sender: Any) {
        setData()
    }
}

extension DonatinDetailsViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: descriptionDonationTextField, label: descriptionDonationInvalidLabel, height: descriptionDonationHeightInvalidLabel)
        checkColorBoderOfTextField(textfield: quantityOfDonationTextField, label: quantityOfDonationInvalidLabel, height: quantityOfDonationHeightInvalidLabel)
        checkColorBoderOfTextField(textfield: fromTimeTextField, label: timeInvalidLabel, height: timeHeightInvalidLabel)
        checkColorBoderOfTextField(textfield: toTimeTextField, label: timeInvalidLabel, height: timeHeightInvalidLabel)
        checkColorBoderOfTextField(textfield: addressTextFiled, label: addressInvalidLabel, height: addressHeightInvalidLabel)
        checkColorBorderOfView(textfield: dateTextFiled, view: dateView, label: dateInvalidLabel, height: dateHeightInvalidLabel)
    }
    
    func setTextFieldDelegate() {
        let textField = [descriptionDonationTextField, quantityOfDonationTextField, fromTimeTextField, toTimeTextField, dateTextFiled, addressTextFiled]
        textField.forEach { $0?.delegate = self }
    }
}

extension DonatinDetailsViewController {
    
    private func addDonationReques(image: UIImage, model: AddDonationRequestModel) {
        apiRequest.addDonationRequest(image: image, model: model) { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let data):
                if let message = data.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    self.moveToThanksDonationVC()
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "هناك خطأ ما")
                }
            case .failure:
                break
            }
        }
    }
}

extension DonatinDetailsViewController: UITextViewDelegate {
    
    func checkColorBorderOfTextView(textView: UITextView) {
        if textView.text == "" {
            textView.layer.borderColor = UIColor(named: "disapleColor")?.cgColor
        } else {
            textView.layer.borderColor = UIColor(named: "AppColor")?.cgColor
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        checkColorBorderOfTextView(textView: textView)
        numberOfCharacterOfCommentLabel.text = "\(UserDefaults.standard.integer(forKey: "NumbetOfCharacter"))/50"
    }
    
    func setTextViewDelegate() {
        commentTextView.delegate = self
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        print(updatedText.count)
        UserDefaults.standard.set(updatedText.count, forKey: "NumbetOfCharacter")
        return updatedText.count <= 50 // Change limit based on your requirement.
    }
}

extension DonatinDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case datePicker:
            return 3
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    
    func setTimePicker() {
        let toolbarFromTime = UIToolbar()
        toolbarFromTime.sizeToFit()
        let doneFromTimeBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneFromTimePressed))
        toolbarFromTime.setItems([doneFromTimeBtn], animated: true)
        let toolbarToTime = UIToolbar()
        toolbarToTime.sizeToFit()
        let doneToTimeBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneToTimePressed))
        toolbarToTime.setItems([doneToTimeBtn], animated: true)
        let timePickerArray = [toTimePicker, fromTimePicker]
        toTimeTextField.inputAccessoryView = toolbarToTime
        fromTimeTextField.inputAccessoryView = toolbarFromTime
        timePickerArray.forEach { $0.preferredDatePickerStyle = .wheels }
        timePickerArray.forEach { $0.locale = Locale(identifier: "en") }
        toTimeTextField.inputView = toTimePicker
        fromTimeTextField.inputView = fromTimePicker
        timePickerArray.forEach { $0.datePickerMode = .time }
    }
    
    @objc func doneFromTimePressed() {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale
        formatter.dateFormat = "hh:mma"
        fromTimeTextField.text = formatter.string(from: fromTimePicker.date)
        self.view.endEditing(true)
    }
    
    @objc func doneToTimePressed() {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale
        formatter.dateFormat = "hh:mma"
        toTimeTextField.text = formatter.string(from: toTimePicker.date)
        self.view.endEditing(true)
    }
    
    func setDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDatePressed))
        toolbar.setItems([doneBtn], animated: true)
        dateTextFiled.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "en")
        dateTextFiled.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func doneDatePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "d/M/yyyy"
        formatter.locale = NSLocale(localeIdentifier: "en") as Locale
        dateTextFiled.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    private func setupPickerView() {
        let textField = [toTimeTextField,fromTimeTextField]
        textField.forEach { $0?.delegate = self }
        setTimePicker()
        setDatePicker()
    }
}

extension DonatinDetailsViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            imageGallery = image
            imageDonation.image = image
        }
        picker.dismiss(animated: true, completion: nil)
        showImage()
        isChooseImageDonation = true
        hideLabel(heightInvalidLabel: addImageHeightInvalidLabel, invalidLabel: addImageInvalidLabel)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}


extension DonatinDetailsViewController: ThanksDonationProtocol {
    
    func movetoHomeVCFromThanksDonation() {
        moveToHomeVC()
    }
}
