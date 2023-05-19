//
//  ProfileAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/05/2023.
//

import Foundation

struct UpdateProfileRequestModel {
    var name: String
    var cityId: Int
    var districtId: Int
    var thumbnail: String
}

protocol ProfileAPIProtocol {
    func profileRequest(completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void)
    func editProfileRequest(completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void)
    func updateProfileRequest(id: Int, model: UpdateProfileRequestModel ,completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void)
}

class ProfileAPI : BaseAPI<ProfileNetwork>, ProfileAPIProtocol {
    func profileRequest(completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void) {
        fetchData(target: .profile, responseClass: ProfileResponseModel.self) { result in
            completion(result)
        }
    }
    
    func editProfileRequest(completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void) {
        fetchData(target: .editProfile, responseClass: ProfileResponseModel.self) { result in
            completion(result)
        }
    }
    
    func updateProfileRequest(id: Int, model: UpdateProfileRequestModel, completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void) {
        fetchData(target: .updateProfile(id: id, model: model), responseClass: ProfileResponseModel.self) { result in
            completion(result)
        }
    }
}



