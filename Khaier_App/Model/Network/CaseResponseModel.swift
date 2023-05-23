//
//  CaseResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 23/05/2023.
//

import Foundation

struct CaseResponseModel: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let title, excerpt, maxAmount, collectedAmount: String
    let percentage, remainingDays: Int
    let category: String
    let thumbnail: String
    let charityName: String
    let charityThumbnail: String
    let charityPhoneNumber: String
    let href: HrefCharity

    enum CodingKeys: String, CodingKey {
        case title, excerpt, maxAmount, collectedAmount, percentage
        case remainingDays = "remaining_days"
        case category, thumbnail, charityName, charityThumbnail, charityPhoneNumber, href
    }
}

struct HrefCharity: Codable {
    let charity: String
}

