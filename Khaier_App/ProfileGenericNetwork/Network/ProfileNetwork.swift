//
//  ProfileNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/05/2023.
//

import Foundation
import Alamofire

enum ProfileNetwork{
    case profile
}

extension ProfileNetwork : TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .profile:
            return "profile"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .profile:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .profile:
            return .requestPlain
        }
    }
        
    var header: [String : String] {
        switch self {
        case .profile:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}
