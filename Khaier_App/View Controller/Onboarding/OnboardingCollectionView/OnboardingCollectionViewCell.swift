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
        changeFontOfLabel()
    }
    
    func setup(slide: OnboardingModel){
        onBoardingImage.image = UIImage(named: slide.image)
        descriptionLabel.text = slide.description
        titleLabel.text = slide.title
    }
    
    func changeFontOfLabel(){
        titleLabel.font = UIFont(name: "IBMPlexSansArabic-Medium", size: 20)
        descriptionLabel.font = UIFont(name: "IBMPlexSansArabic-Regular", size: 16)
    }
}
