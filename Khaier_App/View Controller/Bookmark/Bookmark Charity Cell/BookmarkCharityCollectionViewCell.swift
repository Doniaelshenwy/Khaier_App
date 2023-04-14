//
//  BookmarkCharityCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 20/02/2023.
//

import UIKit

class BookmarkCharityCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "BookmarkCharityCollectionViewCell"
    
    @IBOutlet weak var charityImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCharityData(charity: CharityModel){
        charityImage.image = UIImage(named: charity.image)
        title.text = charity.title
        addressLabel.text = charity.address
       
        colorOfLabelText(label: descriptionLabel, description: charity.description)
    }

    @IBAction func saveCharityButton(_ sender: Any) {
    }


}

