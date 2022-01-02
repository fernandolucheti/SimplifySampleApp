//
//  NetworkRequests.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation
import Moya

enum NetworkRequests {
    case home
}

extension NetworkRequests: TargetType {
    var baseURL: URL {
        URL(string: "https://run.mocky.io/v3/")!
    }
    
    var path: String {
        "93fa1636-db03-43e2-8c56-9c0c212285f4"
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Task {
        .requestParameters(parameters: [:], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    
}
