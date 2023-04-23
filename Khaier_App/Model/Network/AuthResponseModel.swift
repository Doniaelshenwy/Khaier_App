//
//  LoginModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation

struct AuthResponseModel: Codable {
    let user: UserResponseModel?
    let token: String?
    let error: String?
}

struct UserResponseModel: Codable {
    let id: Int?
    let username, name, phoneNumber: String?
    let address: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, username, name
        case phoneNumber = "phone_number"
        case address
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct VerifyPhoneResponseModel: Codable {
    let success: String?
    let error: Errors?
}

struct UpdatePasswordResponseModel: Codable {
    let message: String?
    let link: String?
    let errors: Errors?
}

struct Errors: Codable {
    let phoneNumber, password: [String]?

    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case password
    }
}
