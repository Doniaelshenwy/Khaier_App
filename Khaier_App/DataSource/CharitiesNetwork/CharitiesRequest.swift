//
//  CharitiesRequest.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Foundation

protocol CharitiesRequestProtocol {
    func getCategorys(id: Int, completion: @escaping (Result<CharitiesResponseModel?, NSError>) -> Void)
}

class CharitiesRequest: BaseAPI<CharitiesAPIRequest>, CharitiesRequestProtocol {
    
    func getCategorys(id: Int, completion: @escaping (Result<CharitiesResponseModel?, NSError>) -> Void) {
        fetchData(target: .charities(id: id), responseClass: CharitiesResponseModel.self) { result in
            completion(result)
        }
    }
}
