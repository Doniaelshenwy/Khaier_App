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
        }
    }
    var method: HTTPMethod {
        switch self {
        case .cases:
            return .get
        case .charity:
            return .get
        }
    }
        
    var task: Task {
        switch self {
        case .cases:
            return .requestPlain
        case .charity:
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


