//
//  ProfileResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/05/2023.
//

import Foundation

struct ProfileResponseModel: Codable {
    let user: User
}

struct User: Codable {
    let id: Int
    let name, phoneNumber: String
    let thumbnail: String
}
