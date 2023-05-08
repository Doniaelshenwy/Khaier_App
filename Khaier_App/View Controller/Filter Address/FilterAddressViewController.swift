//
//  FilterAddressViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

protocol AddressFilterationProtocol: AnyObject {
    func passFilterationAddress(casesData: [Case])
}

class FilterAddressViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var checkAddressBoxButton: UIButton!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var cityView: UIControl!
    @IBOutlet weak var regionTextField: UITextField!
    @IBOutlet weak var regionView: UIControl!
    
    var isRemember = false
    private let cityPickerView = UIPickerView()
    private let regionPickerView = UIPickerView()
    private weak var delegate: AddressFilterationProtocol?
    var cityData : [City] = []
    var regionData : [District] = []
    let apiRequest: AuthAPIProtocol = AuthAPI()
    let apiFilterRequest: DataAPIProtocol = DataAPI()
    var search = ""
    var locationUser = ""
    var cityId = 0
    var regionId = 0
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        cityRegisterRequest()
    }
    
    private func filterRequest(model : FilterRequestModel) {
        apiFilterRequest.filterRequest(model: model) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let error = data?.error {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: error)
                } else {
                    self.dismiss(animated: true, completion: nil)
                    self.delegate?.passFilterationAddress(casesData: data?.cases ?? [])
                }
            case .failure(_):
                break
            }
        }
    }
    
    func cityRegisterRequest() {
        apiRequest.cityRegisterRequest { [weak self] response in
            guard let self = self else { return }
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
    
    private func setTextFieldImage() {
        let image = UIImageView()
        image.image = UIImage(named: "down")
        cityTextField.leftViewMode = .always
        cityTextField.leftView = image
    }

    // when user press x button dismiss screen and move to searchVC
    @IBAction func closeFilterAddressView(_ sender: Any) {
        dismiss(animated: false)
    }

    
    // when user check my location, result of search is determined user's location
    @IBAction func checkYourLocationBoxButton(_ sender: Any) {
        checkBoxIsAccept(isRemember: &isRemember, button: checkAddressBoxButton)
        isRemember ? (locationUser = "user") : (locationUser = "")
    }
    
    @IBAction func applyButtonTapped(_ sender: Any) {
        if locationUser == "" {
        guard let city = cityTextField.text, city != "اختر المدينة" else { return }
        guard let region = regionTextField.text, region != "اخترالمنطقة" else { return }
            let model = FilterRequestModel(search: search, city: city, district: region, location: locationUser)
            filterRequest(model: model)
        } else {
            let model = FilterRequestModel(search: search, location: locationUser)
            filterRequest(model: model)
        }
    }
}


extension FilterAddressViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    private func setupPickerView() {
        [cityTextField, regionTextField].forEach({ $0?.delegate = self })
        [cityPickerView, regionPickerView].forEach({$0.delegate = self })
        [cityPickerView, regionPickerView].forEach({$0.dataSource = self })
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
            setAppColorView(cityView)
            checkAddressBoxButton.imageView?.image = UIImage(named: "check")
        case regionPickerView:
            regionTextField.text = regionData[row].name
            regionTextField.resignFirstResponder()
            regionId = regionData[row].id
            setAppColorView(regionView)
            checkAddressBoxButton.imageView?.image = UIImage(named: "check")
        default:
            break
        }
    }
    
}


