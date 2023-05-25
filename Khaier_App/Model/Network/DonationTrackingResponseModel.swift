//
//  DonationTrackingResponseModel.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Foundation

struct DonationTrackingResponseModel: Codable {
    let donatedCases: [DonatedCase]
}

struct DonatedCase: Codable {
    let title: String
    let colorStatus: Int
    let date, startTime, endTime, address: String
    let deliveryStatus: Int

    enum CodingKeys: String, CodingKey {
        case title
        case colorStatus = "Color_status"
        case date
        case startTime = "start_time"
        case endTime = "end_time"
        case address
        case deliveryStatus = "delivery_status"
    }
}
