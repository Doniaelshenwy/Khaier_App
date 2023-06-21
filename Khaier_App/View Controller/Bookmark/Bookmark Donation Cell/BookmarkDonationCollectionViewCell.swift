//
//  BookmarkDonationCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

class BookmarkDonationCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "BookmarkDonationCollectionViewCell"

    @IBOutlet weak var imageCase: UIImageView!
    @IBOutlet weak var typeDonationLabel: UILabel!
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var accessRatioLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var saveCaseButtonConstrain: UIButton!
    
    var donationNowAction: (() -> ())?
    var saveBookmarkAction: (() -> ())?
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Bool?
    var userId : Int?
    var caseId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDonationData(donation: Case){
        saveCaseButtonConstrain.setImage("save-fill")
        //imageCase.image = UIImage(named: "caseSearch")
        imageCase.setImageKF(urlImage: donation.thumbnail ?? Constant.placeHolder)
        titleCaseLabel.text = donation.title
        typeDonationLabel.text = donation.category
        remainDaysLabel.text = "متبقي \(donation.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(donation.percentage ?? 0)"
        progressView.progress = Float(donation.percentage ?? 0) / 100
        bookmarkId = donation.bookmarked
        checkBookmark(bookmarkId: donation.bookmarked ?? false)
        bookmarkId = donation.bookmarked
        userId = donation.userID
        caseId = donation.id
    }
    
    func checkBookmark(bookmarkId: Bool) {
        bookmarkId == false ? saveCaseButtonConstrain.setImage("save") : saveCaseButtonConstrain.setImage("save-fill")
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
    
    @IBAction func saveButton(_ sender: Any) {
        //saveBookmarkAction?()
        editCaseBookmarkRequest(id: caseId ?? 0)
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        donationNowAction?()
    }
}
