//
//  DataAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 01/05/2023.
//

import Foundation

struct FilterRequestModel {
    var search: String
    var city: String?
    var district: String?
    var location: String?
}

protocol DataAPIProtocol {
    func homeRequest(completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void)
    func searchRequest(search: String, completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void)
    func filterRequest(model: FilterRequestModel, completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void)
    func casesRequest(id: Int, completion: @escaping (Result<CaseResponseModel?, NSError>) -> Void)
}

class DataAPI : BaseAPI<DataNetwork>, DataAPIProtocol {
    func homeRequest(completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void) {
        fetchData(target: .home, responseClass: HomeResponseModel.self) { result in
            completion(result)
        }
    }
    
    func searchRequest(search: String, completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void) {
        fetchData(target: .search(search: search), responseClass: HomeResponseModel.self) { result in
            completion(result)
        }
    }
    
    func filterRequest(model: FilterRequestModel, completion: @escaping (Result<HomeResponseModel?, NSError>) -> Void) {
        fetchData(target: .filter(model: model), responseClass: HomeResponseModel.self) { result in
            completion(result)
        }
    }
    
    func casesRequest(id: Int, completion: @escaping (Result<CaseResponseModel?, NSError>) -> Void) {
        fetchData(target: .cases(id: id), responseClass: CaseResponseModel.self) { result in
            completion(result)
        }
    }
}

