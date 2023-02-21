//
//  PriorityCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 16/02/2023.
//

import UIKit

class PriorityCollectionViewCell: UICollectionViewCell {
    static let identifierCell = "PriorityCollectionViewCell"

    @IBOutlet weak var imageCase: UIImageView!
    @IBOutlet weak var titleCaseLabel: UILabel!
    @IBOutlet weak var typeDonationLabel: UILabel!
    @IBOutlet weak var remainDaysLabel: UILabel!
    @IBOutlet weak var accessRatio: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var saveCaseButtonConstrain: UIButton!
    
    var isRememberCase = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCaseData(priority: PriorityModel){
        imageCase.image = UIImage(named: priority.image)
        titleCaseLabel.text = priority.title
        typeDonationLabel.text = priority.typeDonation
        remainDaysLabel.text = "متبقي \(priority.remainDays) يوم"
        accessRatio.text = "%\(priority.accessRatio)"
        progressView.progress = Float(priority.accessRatio) / 100
    }

    @IBAction func saveCaseButton(_ sender: Any) {
        checkSaveButtonIsAccept(isRemember: &isRememberCase, button: saveCaseButtonConstrain)
    }
    @IBAction func donateNowButton(_ sender: Any) {
    }
}
