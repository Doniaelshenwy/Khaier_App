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
    
    private var isSelected = false
    private let apiRequest: DataAPIProtocol = DataAPI()
    private let apiBookmarkRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Bool?
    private var descriptionCharity = ""
    private var id: Int
    
    
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        caseRequest(id: id)
    }
    
    private func moveToDonationDetailsVc() {
        let vc = DonatinDetailsViewController(id: id)
        push(vc: vc)
    }
    
    private func caseRequest(id: Int) {
        apiRequest.casesRequest(id: id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let unwrappedData = data?.data {
                    self.caseTitleLabel.text = unwrappedData.title
                    self.descriptionCharity = unwrappedData.excerpt ?? ""
                    self.setupDonationDescription()
                    self.imageCase.setImageKF(urlImage: unwrappedData.thumbnail ?? "")
                    self.typeDonationLabel.text = unwrappedData.category
                    self.remainDaysLabel.text = "متبقي \(unwrappedData.remainingDays!) يوم"
                    self.accessRatioLabel.text = "%\(unwrappedData.percentage!)"
                    self.progressView.progress = Float(unwrappedData.percentage ?? 0 ) / 100
                    self.charityImage.setImageKF(urlImage: unwrappedData.charityThumbnail ?? "")
                    self.charityTitlleLabel.text = unwrappedData.charityName
                    self.checkBookmark(bookmarkId: unwrappedData.bookmarked ?? false)
                }
            case .failure(_):
                break
            }
        }
    }
    
    private func setupDonationDescription() {
        if isSelected {
            UIView.animate(withDuration: 1) {
                self.charityDescriptionLabel.text = self.descriptionCharity
            }
        } else {
            UIView.animate(withDuration: 1) {
                self.colorOfLabelText(label: self.charityDescriptionLabel, description: self.descriptionCharity)
                self.charityDescriptionLabel.layoutIfNeeded()
            }
        }
    }
    
    private func checkBookmark(bookmarkId: Bool) {
        bookmarkId == false ? saveCaseButtonConstrain.setImage("save") : saveCaseButtonConstrain.setImage("save-fill")
    }
    
    private func editCaseBookmarkRequest(id: Int) {
        apiBookmarkRequest.editCaseBookmarkRequest(id: id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    if message.contains("اضافة") {
                        self.saveCaseButtonConstrain.setImage("save-fill")
                    } else {
                        self.saveCaseButtonConstrain.setImage("save")
                    }
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: "هناك خطأ ما")
                }
            case .failure(_):
                break
            }
        }
    }
    
    @IBAction func readMoreDescriptionCharity(_ sender: Any) {
        isSelected.toggle()
        setupDonationDescription()
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        moveToDonationDetailsVc()
    }
    
    @IBAction func saveCaseButton(_ sender: Any) {
        editCaseBookmarkRequest(id: id ?? 0)
    }
    
    @IBAction func backButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
}
