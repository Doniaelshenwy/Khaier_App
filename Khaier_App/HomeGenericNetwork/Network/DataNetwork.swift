//
//  DataNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 01/05/2023.
//

import Foundation
import Alamofire

enum DataNetwork{
    case home
}

extension DataNetwork : TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self{
        case .home:
            return "home"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .home:
            return .requestPlain
        }
    }
        
    var header: [String : String] {
        switch self {
        case .home:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}

