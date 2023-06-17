//
//  CategoriesCollectionViewCell.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit

class CategoriesCollectionViewCell: UICollectionViewCell {
    
    static let identifierCell = "CategoriesCollectionViewCell"

    @IBOutlet weak var categoryName: UILabel!
    @IBOutlet weak var categoryImage: UIImageView!
    
    func setCategoryData(category: CategoriesModel) {
        categoryName.text = category.name
        categoryImage.image = UIImage(named: category.image)
    }
}
