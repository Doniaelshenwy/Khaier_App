//
//  FilterAddressViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

protocol AddressFilterationProtocol: AnyObject {
    func passFilterationAddress(address: String)
}


class FilterAddressViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var checkAddressBoxButton: UIButton!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addressView: UIView!
    
    var isRemember = false
    private let pickerView = UIPickerView()
    private weak var delegate: AddressFilterationProtocol?
    
    let data = ["المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا","المنصورة", "القاهرة", "دهب","ميت غمر","بنها","طلخا"]
    
    init(delegate: AddressFilterationProtocol? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldImage()
        setupPickerView()
        
    }
    
    
    private func setTextFieldImage() {
        let image = UIImageView()
        image.image = UIImage(named: "down")
        addressTextField.leftViewMode = .always
        addressTextField.leftView = image
    }

    // when user press x button dismiss screen and move to searchVC
    @IBAction func closeFilterAddressView(_ sender: Any) {
        dismiss(animated: true)
    }

    
    // when user check my location, result of search is determined user's location
    @IBAction func checkYourLocationBoxButton(_ sender: Any) {
        checkBoxIsAccept(isRemember: &isRemember, button: checkAddressBoxButton)
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        guard let address = addressTextField.text else { return }
        if address != "اختر المدينة و المنطقة" {
        delegate?.passFilterationAddress(address: address)
        dismiss(animated: true, completion: nil)
        }
    }
}


extension FilterAddressViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
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
        checkAddressBoxButton.imageView?.image = UIImage(named: "check")
    }
    
}


