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


    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setDonationData(donation: CaseDonationModel){
        imageCase.image = UIImage(named: donation.image)
        titleCaseLabel.text = donation.title
        typeDonationLabel.text = donation.typeDonation
        remainDaysLabel.text = "متبقي \(donation.remainDays) يوم"
        accessRatioLabel.text = "%\(donation.accessRatio)"
        progressView.progress = Float(donation.accessRatio) / 100
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
    }

}
