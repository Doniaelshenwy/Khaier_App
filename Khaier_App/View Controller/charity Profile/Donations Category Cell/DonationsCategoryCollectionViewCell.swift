//
//  DonationsCategoryCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 14/04/2023.
//

import UIKit

class DonationsCategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "DonationsCategoryCollectionViewCell"

    @IBOutlet weak var nameCategoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func setDataOfDonationCategoryCell(category: DonationCategoryModel) {
        nameCategoryLabel.text = category.name
        if category.isSelected! {
            nameCategoryLabel.backgroundColor = UIColor(named: "AppColor")
            nameCategoryLabel.textColor = .white
        } else {
            nameCategoryLabel.backgroundColor = .white
            nameCategoryLabel.textColor = UIColor(named: "AppColor")
        }
    }
}
