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
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var bookmarkId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDonationData(donation: Case){
        imageCase.image = UIImage(named: "caseSearch")
        titleCaseLabel.text = donation.title
        typeDonationLabel.text = donation.category
        remainDaysLabel.text = "متبقي \(donation.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(donation.percentage ?? 0)"
        progressView.progress = Float(donation.percentage ?? 0) / 100
        bookmarkId = donation.bookmarkID
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
    
    @IBAction func saveButton(_ sender: Any) {
        deletecaseBookmarkRequest(bookmarkId: bookmarkId ?? 0)
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        donationNowAction?()
    }

}
