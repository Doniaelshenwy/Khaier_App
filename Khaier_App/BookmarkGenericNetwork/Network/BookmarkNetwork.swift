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
        }
    }
    var method: HTTPMethod {
        switch self {
        case .cases:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .cases:
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


