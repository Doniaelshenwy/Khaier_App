//
//  NearCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 16/02/2023.
//

import UIKit

class NearCollectionViewCell: UICollectionViewCell {
    static let identifierCell = "NearCollectionViewCell"

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCharityData(near charity: NearModel){
        image.image = UIImage(named: charity.image)
        title.text = charity.title
        addressLabel.text = charity.address
       
        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: charity.description, attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "BlackColor")!]));
        text.append(NSAttributedString(string: "المزيد", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "AppColor")!]))
        descriptionLabel.attributedText = text
    }

    @IBAction func saveCharityButton(_ sender: Any) {
    }
}



