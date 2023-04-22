//
//  User Network.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation
import Alamofire

enum AuthNetwork{
    case login(model: LoginRequestModel)
    case register(model: RegisterRequestModel)
    case verifyPhone(model: VerifyPhoneRequestModel)
}

extension AuthNetwork : TargetType{
    
    var baseURL: String {
        switch self {
        default:
            return Constant.baseURL
        }
    }
    
    var path: String {
        switch self{
        case .login:
            return "login"
        case .register :
            return "signup"
        case .verifyPhone(model: let model):
            return "Verify_phone_signup"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .register:
            return .post
        case .verifyPhone:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let model):
            return .requestParameter(paramter: ["phone_number" : model.phoneNumber, "password" : model.password], encoding: JSONEncoding.default)
     
        case .register(model: let model):
            return .requestParameter(paramter: ["username" : model.userName, "name" : model.name, "phone_number" : model.phone, "password" : model.password, "address" : model.address], encoding: JSONEncoding.default)
        case .verifyPhone(model: let model):
            return .requestParameter(paramter: ["phone_number" : model.phone_number], encoding: JSONEncoding.default)
        }
    }
    var header: [String : String] {
        switch self {
        default:
            return [:]
        }
    }
}
