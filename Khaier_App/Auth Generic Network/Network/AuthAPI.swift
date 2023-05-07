//
//  UserAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation

struct AuthRequestModel {
    var phoneNumber: String
    var password: String
    var confirmPassword: String?
}

struct RegisterRequestModel {
    var userName: String
    var name: String
    var phone: String
    var password: String
    var passwordConfirmation: String
    var cityId: Int
    var districtId: Int
}

struct VerifyPhoneRequestModel {
    var phone_number: String
}

protocol AuthAPIProtocol : AuthAPI{
    func loginRequest(model: AuthRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void)
    func registerRequest(model: RegisterRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void)
    func verifyPhoneRegisterRequest(model: VerifyPhoneRequestModel, completion: @escaping (Result<VerifyPhoneResponseModel?, NSError>) -> Void)
    func verifyPhoneForgetPasswordRequest(model: VerifyPhoneRequestModel, completion: @escaping (Result<VerifyPhoneResponseModel?, NSError>) -> Void)
    func updatePasswordRequest(model: AuthRequestModel, completion: @escaping (Result<UpdatePasswordResponseModel?, NSError>) -> Void)
    func cityRegisterRequest(completion: @escaping (Result<CityResponseModel?, NSError>) -> Void)
}

class AuthAPI : BaseAPI<AuthNetwork>, AuthAPIProtocol {
    
    func loginRequest(model: AuthRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void){
        fetchData(target: .login(model: model), responseClass: AuthResponseModel.self) { result in
            completion(result)
        }
    }
    
    func registerRequest(model: RegisterRequestModel, completion: @escaping (Result<AuthResponseModel?, NSError>) -> Void) {
        fetchData(target: .register(model: model), responseClass: AuthResponseModel.self) { result in
            completion(result)
        }
    }
    
    func verifyPhoneRegisterRequest(model: VerifyPhoneRequestModel, completion: @escaping (Result<VerifyPhoneResponseModel?, NSError>) -> Void) {
        fetchData(target: .verifyPhoneRegister(model: model), responseClass: VerifyPhoneResponseModel.self) { result in
            completion(result)
        }
    }
    
    func verifyPhoneForgetPasswordRequest(model: VerifyPhoneRequestModel, completion: @escaping (Result<VerifyPhoneResponseModel?, NSError>) -> Void) {
        fetchData(target: .verifyPhoneForgetPassword(model: model), responseClass: VerifyPhoneResponseModel.self) { result in
            completion(result)
        }
    }
    
    func updatePasswordRequest(model: AuthRequestModel, completion: @escaping (Result<UpdatePasswordResponseModel?, NSError>) -> Void) {
        fetchData(target: .updatePassword(model: model), responseClass: UpdatePasswordResponseModel.self) { result in
            completion(result)
        }
    }
    
    func cityRegisterRequest(completion: @escaping (Result<CityResponseModel?, NSError>) -> Void) {
        fetchData(target: .cityRegister, responseClass: CityResponseModel.self) { result in
            completion(result)
        }
    }
    
}
