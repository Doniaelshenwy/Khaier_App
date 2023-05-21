//
//  ProfileResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/05/2023.
//

import Foundation

struct ProfileResponseModel: Codable {
    let user: User?
    let cities: [City]?
    let districts: [District]?
    let address: Address?
    let message: String?
    let errors: Errors?
}

struct User: Codable {
    let id: Int?
    let name, phoneNumber: String?
    let thumbnail: String?
}

struct Address: Codable {
    let city, district: String?
}

