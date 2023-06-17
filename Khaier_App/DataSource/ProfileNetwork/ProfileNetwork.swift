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
    case updateProfile(id: Int, model: UpdateProfileRequestModel)
    case updateProfilePassword(id : Int, model: UpdateProfilePasswordRequestModel)
    case deleteProfile(id: Int)
    case logoutProfile
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
        case .updateProfile(let id, _):
            return "profile/update/\(id)"
        case .updateProfilePassword(let id, _):
            return "profile/update/password/\(id)"
        case .deleteProfile(let id):
            return "profile/delete/\(id)"
        case .logoutProfile:
            return "logout"
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
        case .updateProfilePassword:
            return .post
        case .deleteProfile:
            return .delete
        case .logoutProfile:
            return .post
        }
    }
        
    var task: Task {
        switch self {
        case .profile:
            return .requestPlain
        case .editProfile:
            return .requestPlain
        case .updateProfile(_ , let model):
            return .requestParameter(paramter: ["name" : model.name ?? "",
                                                "city_id" : model.cityId ?? 0,
                                                "district_id" : model.districtId ?? 0,
                                                "thumbnail" : model.thumbnail ?? ""],
                                     encoding: JSONEncoding.default)
        case .updateProfilePassword(_ , let model):
            return .requestParameter(paramter: ["old_password" : model.oldPassword,
                                                "password" : model.password ,
                                                "password_confirmation" : model.passwordConfirmation],
                                     encoding: JSONEncoding.default)
        case .deleteProfile:
            return .requestPlain
        case .logoutProfile:
            return .requestPlain
        }
    }
        
    var header: [String : String] {
        switch self {
        case .updateProfile:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Accept" : "application/json",
                    "Content-Type" : "application/json"]
        case .updateProfilePassword:
            return ["Authorization": "Bearer \(UserDefault.getToken())",
                    "Accept" : "application/json",
                    "Content-Type" : "application/json"]
        default:
            return ["Authorization": "Bearer \(UserDefault.getToken())"]
        }
    }
}
