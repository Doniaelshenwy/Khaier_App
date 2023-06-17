//
//  CategoriesAPIsRequest.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Alamofire

enum CategoriesAPIsRequest{
    case category(id: Int)
}

extension CategoriesAPIsRequest: TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .category(let id):
            return "categories/\(id)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .category:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .category:
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
