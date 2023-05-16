//
//  ProfileAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/05/2023.
//

import Foundation

//struct AddCaseRequestModel {
//    var userId: Int?
//    var caseId: Int?
//}
//
//struct AddCharityRequestModel {
//    var userId: Int?
//    var charityId: Int?
//}

protocol ProfileAPIProtocol {
    func profileRequest(completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void)
//    func casesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
//    func charitiesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
//    func addCaseBookmarkRequest(model: AddCaseRequestModel, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
//    func deleteCaseBookmarkRequest(id: Int, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
//    func addCharityBookmarkRequest(model: AddCharityRequestModel, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
//    func deleteCharityBookmarkRequest(id: Int, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)

}

class ProfileAPI : BaseAPI<ProfileNetwork>, ProfileAPIProtocol {
    func profileRequest(completion: @escaping (Result<ProfileResponseModel?, NSError>) -> Void) {
        fetchData(target: .profile, responseClass: ProfileResponseModel.self) { result in
            completion(result)
        }
    }
}



