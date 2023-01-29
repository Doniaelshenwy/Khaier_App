//
//  OnboardingCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 28/01/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet weak var onBoardingImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(slide: OnboardingModel){
        onBoardingImage.image = UIImage(named: slide.image)
        descriptionLabel.text = slide.description
        titleLabel.text = slide.title
    }
}
