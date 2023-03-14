//
//  AddReminderViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 13/03/2023.
//

import UIKit

class AddReminderViewController: UIViewController {

    @IBOutlet weak var addressInvalidLabel: UILabel!
    @IBOutlet weak var addressHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var dateInvalidLabel: UILabel!
    @IBOutlet weak var dateHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var timeInvalidLabel: UILabel!
    @IBOutlet weak var timeHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var reminderInvalidLabel: UILabel!
    @IBOutlet weak var reminderHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var repeatInvalidLabel: UILabel!
    @IBOutlet weak var repeatHeightInvalidLabel: NSLayoutConstraint!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var reminderTextField: UITextField!
    @IBOutlet weak var repeatTextField: UITextField!
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var reminderView: UIView!
    @IBOutlet weak var repeatView: UIView!
    
    var allDayReminder = false
    
    private let pickerView = UIPickerView()
    
    let data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setupPickerView()
       // setTextFieldImage(nameImage: "arrow-down")
    }
    
    func hideInvalidLabel() {
        hideLabel(heightInvalidLabel: addressHeightInvalidLabel, invalidLabel: addressInvalidLabel)
        hideLabel(heightInvalidLabel: dateHeightInvalidLabel, invalidLabel: dateInvalidLabel)
        hideLabel(heightInvalidLabel: timeHeightInvalidLabel, invalidLabel: timeInvalidLabel)
        hideLabel(heightInvalidLabel: reminderHeightInvalidLabel, invalidLabel: reminderInvalidLabel)
        hideLabel(heightInvalidLabel: repeatHeightInvalidLabel, invalidLabel: repeatInvalidLabel)
    }
    
    func isAllDayReminder() {
        if allDayReminder {
            checkColorBoderOfTextField(textfield: timeTextField, label: timeInvalidLabel, height: timeHeightInvalidLabel)
            timeTextField.isUserInteractionEnabled = false
        } else {
            timeTextField.isUserInteractionEnabled = true
        }
    }
    
    func setData() {
        guard let address = addressTextField.text, address != "" else {
            checkTextFieldIsEmpty(textField: addressTextField, height: addressHeightInvalidLabel, label: addressInvalidLabel)
            return
        }
        guard let date = dateTextField.text, date != "" else {
            checkViewIsEmpty(view: dateView, height: dateHeightInvalidLabel, label: dateInvalidLabel)
            return
        }
        if allDayReminder == false {
        guard let time = timeTextField.text, time != "" else {
            checkTextFieldIsEmpty(textField: timeTextField, height: timeHeightInvalidLabel, label: timeInvalidLabel)
            return
        }
        }
        guard let reminder = reminderTextField.text, reminder != "" else {
            checkViewIsEmpty(view: reminderView, height: reminderHeightInvalidLabel, label: reminderInvalidLabel)
            return
        }
        guard let repeatReminder = repeatTextField.text, repeatReminder != "" else {
            checkViewIsEmpty(view: repeatView, height: repeatHeightInvalidLabel, label: repeatInvalidLabel)
            return
        }
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم اضافه تذكير")
    }
    
    @IBAction func backToReminderVCButton(_ sender: Any) {
        pop(isTabBarHide: true)
    }
    
    @IBAction func showCalenderButton(_ sender: Any) {
       
    }
    
    @IBAction func showReminderAllDayButton(_ sender: Any) {
        allDayReminder.toggle()
        isAllDayReminder()
    }
    
    @IBAction func addReminderButton(_ sender: Any) {
        setData()
    }
}

extension AddReminderViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkColorBoderOfTextField(textfield: addressTextField, label: addressInvalidLabel, height: addressHeightInvalidLabel)
        checkColorBorderOfView(textfield: dateTextField, view: dateView, label: dateInvalidLabel, height: dateHeightInvalidLabel)
        checkColorBoderOfTextField(textfield: timeTextField, label: timeInvalidLabel, height: timeHeightInvalidLabel)
        checkColorBorderOfView(textfield: reminderTextField, view: reminderView, label: reminderInvalidLabel, height: reminderHeightInvalidLabel)
        checkColorBorderOfView(textfield: repeatTextField, view: repeatView, label: repeatInvalidLabel, height: repeatHeightInvalidLabel)
    }
    
    func setTextFieldDelegate() {
        let textField = [addressTextField, dateTextField, timeTextField, reminderTextField, repeatTextField]
        textField.forEach { $0?.delegate = self }
    }
    
}

extension AddReminderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPickerView() {
//        let textField = [reminderTextField, repeatTextField]
//        textField.forEach { $0?.delegate = self }
//        textField.forEach { $0?.inputView = pickerView}
        reminderTextField.delegate = self
        reminderTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    private func setTextFieldImage(nameImage: String) {
        let textField = [reminderTextField, repeatTextField]
        let image = UIImageView()
        image.image = UIImage(named: nameImage)
        textField.forEach { $0?.leftViewMode = .always}
        textField.forEach { $0?.leftView = image}
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
        reminderTextField.text = data[row]
        reminderView.resignFirstResponder()
        setAppColorView(reminderView)
        setTextFieldImage(nameImage: "down")
    }
    
}
