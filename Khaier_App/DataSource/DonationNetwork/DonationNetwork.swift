//
//  DonationTrackingNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 25/05/2023.
//

import Alamofire

enum DonationNetwork {
    case donationDetails
    case myDonation
    case addDonation(model: AddDonationRequestModel)
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
            
        case .addDonation(let model):
            return "donation/\(model.id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .addDonation:
            return .post
        default:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .addDonation(let model):
            return .requestParameter(paramter: [
                "description" : model.description,
                "quantity": model.quantity,
                "pickup_date": model.pickUpDate,
                "pickup_time_start": model.pickUpStartTime,
                "pickup_time_end": model.pickUpEndTime,
                "pickup_address": model.pickUpAddress,
                "thrumbnail": model.thrumbnail
            ], encoding: JSONEncoding.default)
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
