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
    case transactions
    case budget
    case pieChart
}

extension NetworkRequests: TargetType {
    var baseURL: URL {
        URL(string: "https://run.mocky.io/v3/")!
    }
    
    var path: String {
        switch self {
        case .home:
            return "93fa1636-db03-43e2-8c56-9c0c212285f4"
        case .transactions:
            return "f162c8e2-4a72-44d0-897a-b4990bf7dd28"
        case .budget:
            return "212d9443-a053-4724-a5f5-ff9b80b02ad8"
        case .pieChart:
            return "todo"
        }
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
    
    var sampleData: Data {
        switch self {
        case .home:
            return "Home".json ?? Data()
        case .transactions:
            return "Transactions".json ?? Data()
        case .budget:
            return "Budget".json ?? Data()
        case .pieChart:
            return "PieChart".json ?? Data()
        }
    }
}
