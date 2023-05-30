//
//  DonationInViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/04/2023.
//

import UIKit


class DonationInViewController: UIViewController {
    
    @IBOutlet weak var caseTitleLabel: UILabel!
    @IBOutlet weak var charityDescriptionLabel: UILabel!
    @IBOutlet weak var descriptionView: UIControl!
    @IBOutlet weak var imageCase: UIImageView!
    @IBOutlet weak var typeDonationLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var saveCaseButtonConstrain: UIButton!
    @IBOutlet weak var accessRatioLabel: UILabel!
    @IBOutlet weak var donateNowOutlet: UIButton!
    @IBOutlet weak var charityImage: UIImageView!
    @IBOutlet weak var charityTitlleLabel: UILabel!
    @IBOutlet weak var saveCharityButtonConstrain: UIButton!
    
    var isSelected = false
    let apiRequest: DataAPIProtocol = DataAPI()
    var descriptionCharity = ""
    var id = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        colorOfLabelText(label: charityDescriptionLabel, description: descriptionCharity)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        caseRequest(id: id)
    }
    
    private func moveToDonationDetailsVc() {
        let vc = DonatinDetailsViewController()
        push(vc: vc)
    }
    
    private func caseRequest(id: Int) {
        apiRequest.casesRequest(id: id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let unwrappedData = data?.data {
                    self.caseTitleLabel.text = unwrappedData.title
                    self.charityDescriptionLabel.text = unwrappedData.excerpt
                    self.descriptionCharity = unwrappedData.excerpt
                    self.imageCase.setImageKF(urlImage: unwrappedData.thumbnail)
                    self.typeDonationLabel.text = unwrappedData.category
                    self.remainDaysLabel.text = "متبقي \(unwrappedData.remainingDays) يوم"
                    self.accessRatioLabel.text = "%\(unwrappedData.percentage)"
                    self.progressView.progress = Float(unwrappedData.percentage ) / 100
                    self.charityImage.setImageKF(urlImage: unwrappedData.charityThumbnail)
                    self.charityTitlleLabel.text = unwrappedData.charityName
                }
            case .failure(_):
                break
            }
        }
    }
    
    @IBAction func readMoreDescriptionCharity(_ sender: Any) {
        if isSelected == false {
        UIView.animate(withDuration: 1) {
            self.charityDescriptionLabel.text = self.descriptionCharity
        }
            isSelected.toggle()
        } else {
            UIView.animate(withDuration: 100) {

                self.colorOfLabelText(label: self.charityDescriptionLabel, description: self.descriptionCharity)
                self.charityDescriptionLabel.layoutIfNeeded()
            }
            isSelected.toggle()
        }
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        moveToDonationDetailsVc()
    }
    
    @IBAction func saveCaseButton(_ sender: Any) {
    }
    @IBAction func saveCharityButton(_ sender: Any) {
    }
    @IBAction func backButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
}
