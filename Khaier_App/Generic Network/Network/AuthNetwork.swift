//
//  User Network.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation
import Alamofire

enum AuthNetwork{
    case login(model: AuthRequestModel)
    case register(model: RegisterRequestModel)
    case verifyPhoneRegister(model: VerifyPhoneRequestModel)
    case verifyPhoneForgetPassword(model: VerifyPhoneRequestModel)
    case updatePassword(model: AuthRequestModel)
    case cityRegister
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
        case .verifyPhoneRegister:
            return "Verify_phone_signup"
        case .verifyPhoneForgetPassword:
            return "Verify_phone_forgetPassword"
        case .updatePassword:
            return "update_password"
        case .cityRegister:
            return "signup"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .cityRegister:
            return .get
        default:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .login(let model):
            return .requestParameter(paramter: ["phone_number" : model.phoneNumber, "password" : model.password], encoding: JSONEncoding.default)
     
        case .register(let model):
            return .requestParameter(paramter: ["username" : model.userName, "name" : model.name, "phone_number" : model.phone, "password" : model.password, "password_confirmation" : model.passwordConfirmation, "city_id" : model.cityId, "district_id" : model.districtId], encoding: JSONEncoding.default)
        case .verifyPhoneRegister(let model):
            return .requestParameter(paramter: ["phone_number" : model.phone_number], encoding: JSONEncoding.default)
        case .verifyPhoneForgetPassword(let model):
            return .requestParameter(paramter: ["phone_number" : model.phone_number], encoding: JSONEncoding.default)
        case .updatePassword(let model):
            return .requestParameter(paramter: ["phone_number" : model.phoneNumber, "password" : model.password], encoding: JSONEncoding.default)
        case .cityRegister:
            return .requestPlain
        }
    }
    var header: [String : String] {
        switch self {
        case .register:
            return ["Accept" : "application/json", "Content-Type" : "application/json"]
        case .updatePassword:
            return ["Accept" : "application/json", "Content-Type" : "application/json"]
        default:
            return [:]
        }
    }
}
