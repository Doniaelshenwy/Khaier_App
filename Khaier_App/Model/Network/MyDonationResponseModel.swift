//
//  MyDonationResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 30/05/2023.
//

import Foundation

struct MyDonationResponseModel: Codable {
    let donatedCases: [OldCase]?
}

struct OldCase: Codable {
    let userID, id, bookmarkID: Int?
    let title, category, maxAmount, collectedAmount: String?
    let percentage, remainingDays: Int?
    let priority: String?
    let thumbnail: String?
    let href: Href?

    enum CodingKeys: String, CodingKey {
        case userID = "user_id"
        case id
        case bookmarkID = "bookmark_id"
        case title, category, maxAmount, collectedAmount, percentage
        case remainingDays = "remaining_days"
        case priority, thumbnail, href
    }
}

