//
//  BaseAPI.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation
import Alamofire


class BaseAPI<T : TargetType>{
    
    func fetchData<M : Codable>(target: T, responseClass: M.Type, completion: @escaping (Result<M?, NSError>)-> Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let header = Alamofire.HTTPHeaders(target.header)
        let params = buildParamters(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: header).response { dataResponse in
            guard let statusCode = dataResponse.response?.statusCode else { return }
            guard let data = dataResponse.data else { return }
            guard let jsonDecoder = try? JSONDecoder().decode(M.self, from: data) else { return }
            completion(.success(jsonDecoder))
            
//            if statusCode == 200{ // success
////                guard let jsonResponse = try? dataResponse.result.get() else { return }
////                guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else { return }
//                guard let data = dataResponse.data else { return }
//                guard let jsonDecoder = try? JSONDecoder().decode(M.self, from: data) else { return }
//                completion(.success(jsonDecoder))
//            } else { // failed
//                completion(.failure(NSError()))
//            }
        }
    }
    
    func buildParamters(task: Task)->([String: Any], ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameter(let paramter, let encoding):
            return (paramter, encoding)
        }
    }
}
