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
    var bookmarkId : Int?

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDonationData(donation: Case){
        saveCaseButtonConstrain.setImage("save-fill")
        //imageCase.image = UIImage(named: "caseSearch")
        imageCase.setImageKF(urlImage: donation.thumbnail ?? "http://khaier-env.eba-ik9m9yfd.eu-north-1.elasticbeanstalk.com/storage/thumbnails/case/YEjHxNIOf7mi2V8wv7tmErcf8gPChzao5X5ndfiB.png")
        titleCaseLabel.text = donation.title
        typeDonationLabel.text = donation.category
        remainDaysLabel.text = "متبقي \(donation.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(donation.percentage ?? 0)"
        progressView.progress = Float(donation.percentage ?? 0) / 100
        bookmarkId = donation.bookmarkID
    }
    
    @IBAction func saveButton(_ sender: Any) {
        saveBookmarkAction?()
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
        donationNowAction?()
    }
}
