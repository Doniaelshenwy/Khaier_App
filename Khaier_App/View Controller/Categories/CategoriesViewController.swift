//
//  CategoriesViewController.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 21/02/2023.
//

import UIKit

class CategoriesViewController: UIViewController {

    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    var categoriesArray: [CategoriesModel] = []
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isNavigationHidden(true)
        isTabBarHidden(true)
        setCategoryCollectionView()
        setDataOfCategoriesArray()
    }
    
    func setDataOfCategoriesArray() {
        categoriesArray = [
        CategoriesModel(imageCategories: "Cloth", nameCategories: "ملابس"),
        CategoriesModel(imageCategories: "Food", nameCategories: "طعام"),
        CategoriesModel(imageCategories: "medecine", nameCategories: "أدوية"),
        CategoriesModel(imageCategories: "toys", nameCategories: "العاب أطفال"),
        CategoriesModel(imageCategories: "paper", nameCategories: "ورق"),
        CategoriesModel(imageCategories: "plastic", nameCategories: "بلاستيك"),
        CategoriesModel(imageCategories: "furniture", nameCategories: "الأثاث"),
        ]
    }

    @IBAction func backToHomeVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
}
