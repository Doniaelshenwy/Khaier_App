//
//  DonationCaseCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 14/04/2023.
//

import UIKit

class DonationCaseCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "DonationCaseCollectionViewCell"

    @IBOutlet weak var imageCase: UIImageView!
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var typeDonationLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var saveCaseButtonConstrain: UIButton!
    @IBOutlet weak var accessRatioLabel: UILabel!
    @IBOutlet weak var donationDoneImage: UIImageView!
    @IBOutlet weak var donateNowOutlet: UIButton!
    
    var donationNowAction: (() -> ())?
    var isRememberCase = false
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Int?
    var userId : Int?
    var caseId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func checkBookmark(bookmarkId: Int) {
        bookmarkId == 0 ? saveCaseButtonConstrain.setImage("save") : saveCaseButtonConstrain.setImage("save-fill")
    }

    func setCaseData(priority: Case, isHidedonationDone: Bool, isEnabledDonateNow: Bool){
        imageCase.image = UIImage(named: "casePriority")
        titleCaseLabel.text = priority.title
        typeDonationLabel.text = priority.category
        remainDaysLabel.text = "متبقي \(priority.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(priority.percentage ?? 0)"
        progressView.progress = Float(priority.percentage ?? 0) / 100
        donationDoneImage.isHidden = isHidedonationDone
        donateNowOutlet.isEnabled = isEnabledDonateNow
        changeBackgroundColor(isEnabledButton: isEnabledDonateNow)
        checkBookmark(bookmarkId: priority.bookmarkID ?? 0)
        bookmarkId = priority.bookmarkID
        userId = priority.userID
        caseId = priority.id
    }
    
    func changeBackgroundColor(isEnabledButton: Bool) {
        if !(isEnabledButton) {
            donateNowOutlet.backgroundColor = UIColor(named: "DisableColor")
            donateNowOutlet.setTitleColor(.white, for: .disabled)
            remainDaysLabel.text = "تم بحمد الله"
        }
    }
    
    func addcaseBookmarkRequest(model: AddCaseRequestModel) {
        apiRequest.addCaseBookmarkRequest(model: model) { response in
            switch response {
            case .success(let data):
                if let errorUserId = data?.errors?.userID?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: errorUserId)
                } else if let errorCaseId = data?.errors?.myCaseID?[0] {
                    ProgressHUDIndicator.showLoadingIndicatorIsFailed(withErrorMessage: errorCaseId)
                } else {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: data?.message ?? "")
                    self.saveCaseButtonConstrain.setImage("save-fill")
                }
            case .failure(_):
                break
            }
        }
    }
    
    func deletecaseBookmarkRequest(bookmarkId: Int) {
        apiRequest.deleteCaseBookmarkRequest(id: bookmarkId) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                if let message = data?.message {
                    ProgressHUDIndicator.showLoadingIndicatorISSuccessfull(withMessage: message)
                    self.saveCaseButtonConstrain.setImage("save")
                } else {
                    print("not delete")
                }
            case .failure(_):
                break
            }
        }
    }

    @IBAction func saveCaseButton(_ sender: Any) {
        let model = AddCaseRequestModel(userId: userId, caseId: caseId)
        bookmarkId == 0 ? addcaseBookmarkRequest(model: model) : deletecaseBookmarkRequest(bookmarkId: bookmarkId ?? 0)
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        donationNowAction?()
    }
}
