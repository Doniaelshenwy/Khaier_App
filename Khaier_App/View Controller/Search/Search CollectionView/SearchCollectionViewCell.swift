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

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setSearchData(search: Case) {
        imageCase.image = UIImage(named: "caseSearch")
        titleCaseLabel.text = search.title
        typeDonationLabel.text = search.category
        remainDaysLabel.text = "متبقي \(search.remainingDays ?? 0) يوم"
        accessRatioLabel.text = "%\(search.percentage ?? 0)"
        progressView.progress = Float(search.percentage ?? 0) / 100
    }
    
    @IBAction func saveButton(_ sender: Any) {
    }
    
    @IBAction func donateNowButton(_ sender: Any) {
    }

}
