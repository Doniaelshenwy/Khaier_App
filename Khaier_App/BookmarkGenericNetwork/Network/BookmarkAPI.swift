//
//  BookmarkAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 10/05/2023.
//

import Foundation

protocol BookmarkAPIProtocol {
    func casesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
    func charitiesBookmarkRequest(completion: @escaping (Result<BookmarkResponseModel?, NSError>) -> Void)
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
}


