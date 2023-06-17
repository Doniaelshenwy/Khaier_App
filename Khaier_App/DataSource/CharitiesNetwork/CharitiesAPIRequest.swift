//
//  CharitiesAPIRequest.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Alamofire

enum CharitiesAPIRequest {
    case charities(id: Int)
}

extension CharitiesAPIRequest: TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .charities(let id):
            return "charities/\(id)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .charities:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .charities:
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
