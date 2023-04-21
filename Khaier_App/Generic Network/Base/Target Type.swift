//
//  Target Type.swift
//  Khaier_App
//
//  Created by Donia Elshenawy on 17/04/2023.
//

import Foundation
import Alamofire

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    case requestPlain
    case requestParameter(paramter: [String : Any], encoding: ParameterEncoding)
}

protocol TargetType{
    var baseURL : String { get }
    var path : String { get }
    var method : HTTPMethod { get }
    var task : Task { get }
    var header : [String : String] { get }
}
