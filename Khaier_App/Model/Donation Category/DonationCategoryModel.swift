//
//  DonationCategoryModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 15/04/2023.
//

import Foundation

class DonationCategoryModel {
    var name: String = ""
    var isSelected: Bool? = false
    
    init(name: String, isSelected: Bool?) {
        self.name = name
        self.isSelected = isSelected
    }
    
}
