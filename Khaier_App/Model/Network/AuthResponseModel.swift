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
    let errors: Errors?
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

struct CityResponseModel: Codable {
    let cities: [City]
    let districts: [District]
}

struct City: Codable {
    let id: Int
    let name: String
}

struct District: Codable {
    let id: Int
    let name: String
    let cityID: Int

    enum CodingKeys: String, CodingKey {
        case id, name
        case cityID = "city_id"
    }
}

struct VerifyPhoneResponseModel: Codable {
    let message: String?
    let error: Errors?
}

struct UpdatePasswordResponseModel: Codable {
    let message: String?
    let link: String?
    let errors: Errors?
}

struct Errors: Codable {
    let username, phoneNumber, password: [String]?
    let login: String?
    let userID: [String]?
    let myCaseID: [String]?

    enum CodingKeys: String, CodingKey {
        case phoneNumber = "phone_number"
        case password
        case username
        case login
        case userID = "user_id"
        case myCaseID = "my_case_id"
    }
}

struct RegisterResponseModel: Codable {
    let user: UserRegisterResponseModel?
    let token: String?
    let error: Errors?
    let message: String?
}

struct UserRegisterResponseModel: Codable {
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
