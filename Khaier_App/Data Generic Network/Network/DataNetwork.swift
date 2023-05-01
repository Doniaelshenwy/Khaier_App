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

extension DataNetwork : DataTargetType {
    var baseURL: String {
        switch self {
        default:
            return Constant.dataBaseURL
        }
    }
    
    var path: String {
        switch self{
        case .home:
            return "home"
        }
    }
    var method: HTTPMethodData {
        switch self {
        case .home:
            return .get
        }
    }
        
    var task: TaskData {
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

