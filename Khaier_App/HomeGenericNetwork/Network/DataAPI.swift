//
//  DataAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 01/05/2023.
//

import Foundation

protocol DataAPIProtocol {
    func homeRequest(completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void)
}

class DataAPI : BaseAPI<DataNetwork>, DataAPIProtocol {
    func homeRequest(completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void) {
        fetchData(target: .home, responseClass: HomeResponseModel.self) { result in
            completion(result)
        }
    }
}

