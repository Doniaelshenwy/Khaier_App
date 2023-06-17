//
//  CategoriesResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Foundation

struct CategoriesResponseModel: Codable {
    let categoryName: String?
    let cases: [Case]?
}
