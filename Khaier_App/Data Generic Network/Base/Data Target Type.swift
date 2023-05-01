//
//  Data Target Type.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 01/05/2023.
//

import Foundation
import Alamofire

enum HTTPMethodData : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum TaskData {
    case requestPlain
    case requestParameter(paramter: [String : Any], encoding: ParameterEncoding)
}

protocol DataTargetType{
    var baseURL : String { get }
    var path : String { get }
    var method : HTTPMethodData { get }
    var task : TaskData { get }
    var header : [String : String] { get }
}

