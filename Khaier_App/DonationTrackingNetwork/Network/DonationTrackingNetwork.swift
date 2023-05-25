//
//  DonationTrackingNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Foundation

import Alamofire

enum DonationTrackingNetwork{
    case donationDetails
}

extension DonationTrackingNetwork : TargetType {
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

        }
    }
    var method: HTTPMethod {
        switch self {
        case .donationDetails:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .donationDetails:
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

