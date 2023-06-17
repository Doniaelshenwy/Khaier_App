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
            CategoriesModel(id: 1, image: "Cloth", name: "ملابس"),
            CategoriesModel(id: 2, image: "Food", name: "طعام"),
            CategoriesModel(id: 3, image: "medecine", name: "أدوية"),
            CategoriesModel(id: 4, image: "toys", name: "العاب أطفال"),
            CategoriesModel(id: 5, image: "paper", name: "ورق"),
            CategoriesModel(id: 6, image: "plastic", name: "بلاستيك"),
            CategoriesModel(id: 7, image: "furniture", name: "الأثاث"),
        ]
    }

    @IBAction func backToHomeVCButton(_ sender: Any) {
        pop(isTabBarHide: false)
    }
    
}
