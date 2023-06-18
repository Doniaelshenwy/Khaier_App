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
    @IBOutlet weak var donateNowOutlet: UILabel!
    
    var donationNowAction: (() -> ())?
    var favAction: (() -> ())?
    var isRememberCase = false
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Bool?
    var userId : Int?
    var caseId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func checkBookmark(bookmarkId: Bool) {
        bookmarkId == false ? saveCaseButtonConstrain.setImage("save") : saveCaseButtonConstrain.setImage("save-fill")
    }

    func setCaseData(priority: Case, isHidedonationDone: Bool, isEnabledDonateNow: Bool){
        imageCase.setImageKF(urlImage: priority.thumbnail ?? Constant.placeHolder)
        titleCaseLabel.text = priority.title
        typeDonationLabel.text = priority.category
        remainDaysLabel.text = "متبقي \(priority.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(priority.percentage ?? 0)"
        progressView.progress = Float(priority.percentage ?? 0) / 100
        donationDoneImage.isHidden = isHidedonationDone
        donateNowOutlet.isEnabled = isEnabledDonateNow
        changeBackgroundColor(isEnabledButton: isEnabledDonateNow)
        checkBookmark(bookmarkId: priority.bookmarked ?? false)
        bookmarkId = priority.bookmarked
        userId = priority.userID
        caseId = priority.id
    }
    
    func changeBackgroundColor(isEnabledButton: Bool) {
        if !(isEnabledButton) {
            donateNowOutlet.backgroundColor = UIColor(named: "DisableColor")
            //donateNowOutlet.setTitleColor(.white, for: .disabled)
            remainDaysLabel.text = "تم بحمد الله"
        }
    }
    
    func editCaseBookmarkRequest(id: Int) {
        apiRequest.editCaseBookmarkRequest(id: id) { [weak self] response in
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

    @IBAction func saveCaseButton(_ sender: Any) {
        editCaseBookmarkRequest(id: caseId ?? 0)
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        donationNowAction?()
    }
}
