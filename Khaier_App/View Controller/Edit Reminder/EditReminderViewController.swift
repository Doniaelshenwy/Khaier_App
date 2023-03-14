//
//  EditReminderViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 14/03/2023.
//

import UIKit

class EditReminderViewController: UIViewController {
    
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
    
    private let reminderPickerView = UIPickerView()
    private let repeatPickerView = UIPickerView()
    private let datePicker = UIDatePicker()
    private let timePicker = UIDatePicker()
    
    let reminderData = ["قبل 15 دقيقة", " قبل 30 دقيقة","  قبل 45 دقيقة","  قبل ساعة","  قبل ساعتين","  قبل يوم"," قبل يومين"]
    let repeatData = ["تكرار","كل يوم","كل أسبوع","كل شهر","كل سنة"]

    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        hideInvalidLabel()
        setTextFieldDelegate()
        setupPickerView()
        setReminderTextFieldImage(nameImage: "down")
        setRepeatTextFieldImage(nameImage: "down")
        setTimeTextFieldImage(nameImage: "down")
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
            timeTextField.text = ""
            setGrayColorTF(timeTextField)
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
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم حفظ التعديل")
    }
    
    @IBAction func backToReminderVCButton(_ sender: Any) {
        pop(isTabBarHide: true)
    }
    
    @IBAction func showReminderAllDayButton(_ sender: Any) {
        allDayReminder.toggle()
        isAllDayReminder()
    }
    
    @IBAction func saveEditReminderButton(_ sender: Any) {
        setData()
    }
    
    @IBAction func removeReminderButton(_ sender: Any) {
        ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: "تم مسح التذكير")
    }
}

extension EditReminderViewController: UITextFieldDelegate {
    
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

extension EditReminderViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func setTimePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneTimePressed))
        toolbar.setItems([doneBtn], animated: true)
        timeTextField.inputAccessoryView = toolbar
        timePicker.preferredDatePickerStyle = .wheels
        timePicker.locale = Locale(identifier: "ar")
        timeTextField.inputView = timePicker
        timePicker.datePickerMode = .time
    }
    
    @objc func doneTimePressed() {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ar") as Locale
        formatter.dateFormat = "hh:mm a"
        timeTextField.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    func setDatePicker() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneDatePressed))
        toolbar.setItems([doneBtn], animated: true)
        dateTextField.inputAccessoryView = toolbar
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = Locale(identifier: "ar")
        dateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func doneDatePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.dateFormat = "d MMM yyyy"
        formatter.locale = NSLocale(localeIdentifier: "ar") as Locale
        dateTextField.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    private func setupPickerView() {
        let textField = [reminderTextField, repeatTextField,timeTextField]
        textField.forEach { $0?.delegate = self }
        reminderTextField.inputView = reminderPickerView
        repeatTextField.inputView = repeatPickerView
        let pickerView = [reminderPickerView, repeatPickerView]
        pickerView.forEach { $0.delegate = self }
        pickerView.forEach { $0.dataSource = self }
        setTimePicker()
        setDatePicker()
    }
    
    private func setReminderTextFieldImage(nameImage: String) {
        let image = UIImageView()
        image.image = UIImage(named: nameImage)
        reminderTextField.leftViewMode = .always
        reminderTextField.leftView = image
        repeatTextField.leftViewMode = .always
        repeatTextField.leftView = image
    }
    
    private func setRepeatTextFieldImage(nameImage: String) {
        let image = UIImageView()
        image.image = UIImage(named: nameImage)
        repeatTextField.leftViewMode = .always
        repeatTextField.leftView = image
    }
    
    private func setTimeTextFieldImage(nameImage: String) {
        let imageView = UIImageView(image: UIImage(named: nameImage))
           imageView.frame = CGRect(x: 16, y: 8, width: imageView.image!.size.width , height: imageView.image!.size.height)
           let paddingView: UIView = UIView.init(frame: CGRect(x: 16, y: 8, width: 24, height: 24))
           paddingView.addSubview(imageView)
           timeTextField.leftViewMode = .always
           timeTextField.leftView = paddingView
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        switch pickerView {
        case reminderPickerView:
            return 1
        case repeatPickerView:
            return 1
        case datePicker:
            return 3
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case reminderPickerView:
            return reminderData.count
        case repeatPickerView:
            return repeatData.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case reminderPickerView:
            return reminderData[row]
        case repeatPickerView:
            return repeatData[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == reminderPickerView {
            reminderTextField.text = reminderData[row]
            reminderView.resignFirstResponder()
            setAppColorView(reminderView)
        } else {
            repeatTextField.text = repeatData[row]
            repeatView.resignFirstResponder()
            setAppColorView(repeatView)
        }
    }
    
}
