//
//  BookmarkAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/05/2023.
//

import Foundation

struct AddCaseRequestModel {
    var userId: Int?
    var caseId: Int?
}

struct AddCharityRequestModel {
    var userId: Int?
    var charityId: Int?
}

protocol BookmarkAPIProtocol {
    func casesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
    func charitiesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
    func addCaseBookmarkRequest(model: AddCaseRequestModel, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
    func deleteCaseBookmarkRequest(id: Int, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
    func addCharityBookmarkRequest(model: AddCharityRequestModel, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
    func deleteCharityBookmarkRequest(id: Int, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)

}

class BookmarkAPI : BaseAPI<BookmarkNetwork>, BookmarkAPIProtocol {
    
    func casesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void) {
        fetchData(target: .cases, responseClass: BookmarkResponseModel.self) { result in
            completion(result)
        }
    }
    
    func charitiesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void) {
        fetchData(target: .charity, responseClass: BookmarkResponseModel.self) { result in
            completion(result)
        }
    }
    
    func addCaseBookmarkRequest(model: AddCaseRequestModel, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void) {
        fetchData(target: .addCase(model: model), responseClass: BookmarkResponseModel.self) { result in
            completion(result)
        }
    }
    
    func deleteCaseBookmarkRequest(id: Int, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void) {
        fetchData(target: .deleteCase(id: id), responseClass: BookmarkResponseModel.self) { result in
            completion(result)
        }
    }
    
    func addCharityBookmarkRequest(model: AddCharityRequestModel, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void) {
        fetchData(target: .addCharity(model: model), responseClass: BookmarkResponseModel.self) { result in
            completion(result)
        }
    }
    
    func deleteCharityBookmarkRequest(id: Int, completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void) {
        fetchData(target: .deleteCharity(id: id), responseClass: BookmarkResponseModel.self) { result in
            completion(result)
        }
    }
}


