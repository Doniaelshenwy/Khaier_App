//
//  UserAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation

struct LoginRequestModel {
    var phoneNumber: String
    var password: String
}

struct RegisterRequestModel {
    var userName: String
    var name: String
    var phone: String
    var password: String
    var address: String
}

protocol AuthAPIProtocol : AuthAPI{
    func loginRequest(model: LoginRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void)
    func registerRequest(model: RegisterRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void)
}

class AuthAPI : BaseAPI<AuthNetwork>, AuthAPIProtocol{
    func loginRequest(model: LoginRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void){
        fetchData(target: .login(model: model), responseClass: AuthResponseModel.self) { result in
            completion(result)
        }
    }
    
    func registerRequest(model: RegisterRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void) {
        fetchData(target: .register(model: model), responseClass: AuthResponseModel.self) { result in
            completion(result)
        }
    }
}
