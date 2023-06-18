//
//  BookmarkNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/05/2023.
//

import Foundation
import Alamofire

enum BookmarkNetwork {
    case cases
    case charity
    case editCharity(id: Int)
    case editCase(id: Int)
}

extension BookmarkNetwork : TargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self {
        case .cases:
            return "bookmarks/cases"
        case .charity:
            return "bookmarks/charities"
        case .editCharity:
            return "bookmarks/charities"
        case .editCase:
            return "bookmarks/cases"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .cases:
            return .get
        case .charity:
            return .get
        case .editCharity:
            return .post
        case .editCase:
            return .post
        }
    }
        
    var task: Task {
        switch self {
        case .cases:
            return .requestPlain
        case .charity:
            return .requestPlain
        case .editCharity(let id):
            return .requestParameter(paramter: ["charity_id" : id], encoding: JSONEncoding.default)
        case .editCase(let id):
            return .requestParameter(paramter: ["my_case_id" : id], encoding: JSONEncoding.default)
        }
    }
        
    var header: [String : String] {
        switch self {
        case .editCharity:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Content-Type" : "application/json"]
        case .editCase:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Content-Type" : "application/json"]
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}


