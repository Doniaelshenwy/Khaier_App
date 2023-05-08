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
    case filter(model: FilterRequestModel)
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
        default:
            return "home"
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
        case .home:
            return .requestPlain
        case .search(let search):
            return .requestParameter(paramter: ["search" : search], encoding: URLEncoding.default)
        case .filter(model: let model):
            return.requestParameter(paramter: ["search" : model.search, "city" : model.city ?? "", "district" : model.district ?? "", "location" : model.location ?? ""], encoding: URLEncoding.default)
        }
    }
        
    var header: [String : String] {
        switch self {
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}

