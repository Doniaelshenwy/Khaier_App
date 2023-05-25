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
            
//            if statusCode >= 200 && statusCode <= 300{ // success
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

//
//class BaseAPI<T: TargetType> {
//
//    var acceptableStatusCodes = [] + (200..<300).reversed() + (400..<500).reversed()
//
//    func fetchData<M: Codable>(target: T, responseClass: M.Type, completion: @escaping(Result<M,Error>)-> Void){
//
//        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
//        let headers = target.headers
//        let params = buildParams(task: target.task)
//
//        guard ReachabilityManager.shared.reachability?.connection != Reachability.Connection.none else {
//            ReachabilityManager.shared.multicastDelegate.invokeDelegates({$0.connectionChanged(status: .none)})
//            completion(.failure(CustomError(title: "No Connection", description: "Internet Connection is Unavailable", code: 1000)))
//            return
//        }
//
//        AF.request(target.baseURL + target.pathURL, method: method, parameters: params.0, encoding: params.1, headers: headers).validate(statusCode: acceptableStatusCodes ).response { (response ) in
//
//            switch response.result {
//            case .success(let data):
//                guard let responseOBJ = try? JSONDecoder().decode(M.self, from: data!) else {
//                    completion(.failure(CustomError(title: "An Error Has Occured", description: ErrorMessageConstants.genericErrorMessage , code: 1)))
//                    return
//                }
//
//                if response.response?.statusCode == 200 {
//                    completion(.success(responseOBJ))
//                } else {
//                    guard let errorMessage = responseOBJ.asJson()?["message"] as? String else {
//                        completion(.failure(CustomError(title: "An Error Has Occured", description:ErrorMessageConstants.genericErrorMessage , code: response.response?.statusCode ?? 1)))
//
//                        return
//                    }
//                    completion(.failure(CustomError(title: "An Error Has Occured", description: errorMessage, code: response.response?.statusCode ?? 1)))
//
//                }
//
//            case .failure(let error):
//                completion(.failure(CustomError(title: error.localizedDescription, description: error.localizedDescription , code: 1)))
//
//            }
//        }
//    }
//
//
//    func uploadImage<M: Codable>(image:UIImage,target: T, responseClass: M.Type, completion: @escaping(Result<M,Error>)-> Void) {
//
//
//
//        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
//        let headers = target.headers
//        let params = buildParams(task: target.task)
//        let url = target.baseURL + target.pathURL
//
//        AF.upload(multipartFormData: { multipartFormData in
//                multipartFormData
//                .append(image.jpegData(compressionQuality: 0.7)!,
//                        withName: "image" ,
//                        fileName: "image.jpeg",
//                        mimeType: "image/jpeg"
//                )
//        },
//                  to: url,
//                  method: method ,
//                  headers: headers
//        )
//            .response { response in
//                do {
//                    let data = try response.result.get()
//                    let object = try JSONDecoder().decode(M.self, from: data!)
//                    completion(.success(object))
//                } catch {
//                    completion(.failure(CustomError(title: error.localizedDescription, description: error.localizedDescription , code: 1)))
//                }
//            }
//    }
//
//    typealias ImageUploadParamterName = APIConstants.paramatersConstants
//
//    func uploadMultiPartFormData<M: Codable>(imagesData:[Data],imageParamaterName:ImageUploadParamterName,target: T, responseClass: M.Type, completion: @escaping(Result<M,Error>)-> Void) {
//
//        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
//        let headers = target.headers
//        let params = buildParams(task: target.task)
//        let url = target.baseURL + target.pathURL
//
//        let imageParamName = imageParamaterName.rawValue
//
//        AF.upload(multipartFormData: { multipartFormData in
//                    // import image to request
//            for imageData in imagesData {
//                        multipartFormData.append(imageData, withName: "\(imageParamName)", fileName: "\(Date().timeIntervalSince1970).jpeg", mimeType: "image/jpeg")
//            }
//            for (key, value) in params.0 {
//                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
//
//            }
//                }, to: url,
//                  method: method,
//                  headers: headers
//        ).validate(statusCode: acceptableStatusCodes).response { response in
//
//            switch response.result {
//
//            case .success(let data):
//                guard let responseOBJ = try? JSONDecoder().decode(M.self, from: data!) else {
//                    completion(.failure(CustomError(title: "An Error Has Occured", description: ErrorMessageConstants.genericErrorMessage , code: 1)))
//                    return
//                }
//
//                if response.response?.statusCode == 200 {
//                    completion(.success(responseOBJ))
//                } else {
//                    guard let errorMessage = responseOBJ.asJson()?["message"] as? String else {
//                        completion(.failure(CustomError(title: "An Error Has Occured", description:ErrorMessageConstants.genericErrorMessage , code: 1)))
//
//                        return
//                    }
//                    completion(.failure(CustomError(title: "An Error Has Occured", description: errorMessage, code: 1)))
//
//                }
//            case .failure(let error):
//                completion(.failure(CustomError(title: error.localizedDescription, description: error.localizedDescription , code: 1)))
//
//            }
//        }
//    }
//
//    private func buildParams(task: Task) -> ([String: Any], ParameterEncoding){
//        switch task {
//        case .requestPlain:
//            return ([:], URLEncoding.default)
//        case .requestParameters(parameters: let parameters, encoding: let encoding):
//            return (parameters, encoding)
//        }
//    }
//}
