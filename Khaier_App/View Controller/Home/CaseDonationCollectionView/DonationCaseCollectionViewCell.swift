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
    
    var isRememberCase = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCaseData(priority: CaseDonationModel){
        imageCase.image = UIImage(named: priority.image)
        titleCaseLabel.text = priority.title
        typeDonationLabel.text = priority.typeDonation
        remainDaysLabel.text = "متبقي \(priority.remainDays) يوم"
        accessRatioLabel.text = "%\(priority.accessRatio)"
        progressView.progress = Float(priority.accessRatio) / 100
    }

    @IBAction func saveCaseButton(_ sender: Any) {
        checkSaveButtonIsAccept(isRemember: &isRememberCase, button: saveCaseButtonConstrain)
    }
    @IBAction func donateNowButton(_ sender: Any) {
    }
}
