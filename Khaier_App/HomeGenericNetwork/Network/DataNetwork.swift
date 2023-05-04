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
    case search(search: String)
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
        case .search:
            return "home"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .home:
            return .get
        case .search:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .home:
            return .requestPlain
        case .search(let search):
            return .requestParameter(paramter: ["search" : search], encoding: URLEncoding.default)
        }
    }
        
    var header: [String : String] {
        switch self {
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}

