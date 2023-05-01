//
//  DataResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 01/05/2023.
//

import Foundation

struct HomeResponseModel: Codable {
    let user: UserHome?
    let categories: Categories?
    let cases: [Case]?
    let charities: [Charity]?
}

struct Case: Codable {
    let id: Int?
    let title, category, maxAmount, collectedAmount: String?
    let percentage, remainingDays: Int?
    let priority, thumbnail: String?
    let href: Href?

    enum CodingKeys: String, CodingKey {
        case id, title, category, maxAmount, collectedAmount, percentage
        case remainingDays = "remaining_days"
        case priority, thumbnail, href
    }
}

struct Href: Codable {
    let fullCard: String?
}

struct Categories: Codable {
    let allCategoriesLink: String?
    let categories: [Category]?

    enum CodingKeys: String, CodingKey {
        case allCategoriesLink = "All categories link"
        case categories
    }
}

struct Category: Codable {
    let id: Int?
    let name: String?
    let link: String?
}

struct Charity: Codable {
    let id: Int?
    let name, excerpt, address, thumbnail: String?
    let href: String?
}

struct UserHome: Codable {
    let name, address: String?
}
