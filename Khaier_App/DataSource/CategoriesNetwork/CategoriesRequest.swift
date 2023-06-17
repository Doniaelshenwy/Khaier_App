//
//  CategoriesRequest.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/06/2023.
//

import Foundation

protocol CategoriesRequestProtocol {
    func getCategorys(id: Int, completion: @escaping (Result<CategoriesResponseModel?, NSError>) -> Void)
}

class CategoriesRequest: BaseAPI<CategoriesAPIsRequest>, CategoriesRequestProtocol {
    
    func getCategorys(id: Int, completion: @escaping (Result<CategoriesResponseModel?, NSError>) -> Void) {
        fetchData(target: .category(id: id), responseClass: CategoriesResponseModel.self) { result in
            completion(result)
        }
    }
}
