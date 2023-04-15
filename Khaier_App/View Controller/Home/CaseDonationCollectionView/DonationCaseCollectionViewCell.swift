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
    
    var isRememberCase = false

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCaseData(priority: CaseDonationModel, isHidedonationDone: Bool, isEnabledDonateNow: Bool){
        imageCase.image = UIImage(named: priority.image)
        titleCaseLabel.text = priority.title
        typeDonationLabel.text = priority.typeDonation
        remainDaysLabel.text = "متبقي \(priority.remainDays) يوم"
        accessRatioLabel.text = "%\(priority.accessRatio)"
        progressView.progress = Float(priority.accessRatio) / 100
        donationDoneImage.isHidden = isHidedonationDone
        donateNowOutlet.isEnabled = isEnabledDonateNow
        changeBackgroundColor(isEnabledButton: isEnabledDonateNow)
    }
    
    func changeBackgroundColor(isEnabledButton: Bool) {
        if !(isEnabledButton) {
            donateNowOutlet.backgroundColor = UIColor(named: "DisableColor")
            donateNowOutlet.setTitleColor(.white, for: .disabled)
            remainDaysLabel.text = "تم بحمد الله"
        }
    }

    @IBAction func saveCaseButton(_ sender: Any) {
        checkSaveButtonIsAccept(isRemember: &isRememberCase, button: saveCaseButtonConstrain)
    }
    @IBAction func donateNowButton(_ sender: Any) {
    }
}
