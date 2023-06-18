//
//  SearchCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 19/02/2023.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "SearchCollectionViewCell"

    @IBOutlet weak var imageCase: UIImageView!
    @IBOutlet weak var typeDonationLabel: UILabel!
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var accessRatioLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var saveCaseButtonConstrain: UIButton!
    
    let apiRequest: BookmarkAPIProtocol = BookmarkAPI()
    var isRememberCase = false
    var bookmarkId : Bool?
    var userId : Int?
    var caseId : Int?
    var donationNowAction: (() -> ())?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func checkBookmark(bookmarkId: Bool) {
        bookmarkId == false ? saveCaseButtonConstrain.setImage("save") : saveCaseButtonConstrain.setImage("save-fill")
    }
    
    func setSearchData(search: Case) {
        //imageCase.image = UIImage(named: "caseSearch")
        imageCase.setImageKF(urlImage: search.thumbnail ?? "http://khaier-env.eba-ik9m9yfd.eu-north-1.elasticbeanstalk.com/storage/thumbnails/case/YEjHxNIOf7mi2V8wv7tmErcf8gPChzao5X5ndfiB.png")
        titleCaseLabel.text = search.title
        typeDonationLabel.text = search.category
        remainDaysLabel.text = "متبقي \(search.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(search.percentage ?? 0)"
        progressView.progress = Float(search.percentage ?? 0) / 100
        checkBookmark(bookmarkId: search.bookmarked ?? false)
        bookmarkId = search.bookmarked
        userId = search.userID
        caseId = search.id
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
        editCaseBookmarkRequest(id: caseId ?? 0)
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        donationNowAction?()
    }

}
