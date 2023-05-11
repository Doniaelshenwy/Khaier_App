//
//  BookmarkNetwork.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/05/2023.
//

import Foundation
import Alamofire

enum BookmarkNetwork{
    case cases
    case charity
    case addCase(model: AddCaseRequestModel)
    case deleteCase(id: Int)
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
        case .addCase:
            return "bookmarks/cases"
        case .deleteCase(let id):
            return "bookmarks/cases/\(id)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .cases:
            return .get
        case .charity:
            return .get
        case .addCase:
            return .post
        case .deleteCase:
            return .delete
        }
    }
        
    var task: Task {
        switch self {
        case .cases:
            return .requestPlain
        case .charity:
            return .requestPlain
        case .addCase(let model):
            return.requestParameter(paramter: ["user_id" : model.userId, "my_case_id" : model.caseId], encoding: JSONEncoding.default)
        case .deleteCase:
            return .requestPlain
        }
    }
        
    var header: [String : String] {
        switch self {
        case .addCase:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Accept" : "application/json", "Content-Type" : "application/json"]
        case .deleteCase:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Content-Type" : "application/json"]
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}


