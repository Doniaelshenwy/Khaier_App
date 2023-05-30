//
//  DonationTrackingNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Foundation

import Alamofire

enum DonationNetwork{
    case donationDetails
    case myDonation
}

extension DonationNetwork : TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .donationDetails:
            return "donation/details"

        case .myDonation:
            return "donation/old/cases"
        }
    }
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }
        
    var header: [String : String] {
        switch self {
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}

