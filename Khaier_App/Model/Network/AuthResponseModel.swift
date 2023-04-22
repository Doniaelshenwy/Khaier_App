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
    let error: Error?
}

struct Error: Codable {
    let phoneNumber: [String]?

    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
    }
}
