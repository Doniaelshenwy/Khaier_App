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
    case editProfile
    case updateProfile(id : Int, model: UpdateProfileRequestModel?)
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
        case .editProfile:
            return "profile/edit"
        case .updateProfile(let id):
            return "profile/update/\(id)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .profile:
            return .get
        case .editProfile:
            return .get
        case .updateProfile:
            return .post
        }
    }
        
    var task: Task {
        switch self {
        case .profile:
            return .requestPlain
        case .editProfile:
            return .requestPlain
        case .updateProfile(let data, let model):
            return .requestParameter(paramter: ["name" : model?.name ?? "", "city_id" : model?.cityId ?? 0, "district_id" : model?.districtId ?? 0, "thumbnail" : model?.thumbnail ?? ""], encoding: JSONEncoding.default)
        }
    }
        
    var header: [String : String] {
        switch self {
        case .updateProfile:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Accept" : "application/json", "Content-Type" : "application/json"]
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}
