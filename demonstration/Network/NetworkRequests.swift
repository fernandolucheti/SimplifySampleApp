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
    case transactions(monthYear: MonthYear)
    case budget(monthYear: MonthYear)
    case pieChart(monthYear: MonthYear)
    case budgetBar
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
            return "6cd13d2c-8844-4358-a5d0-5aa523f724dd"
        case .budget:
            return "28234f5c-4cd5-46ce-b6ba-cecb1e4f01d4"
        case .pieChart:
            return "f53db189-53e0-4d09-b804-98b25a59d29d"
        case .budgetBar:
            return "d495967a-2faf-48b7-8d53-4a83a64e1030"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .home, .budgetBar:
            return .get
        case .transactions, .budget, .pieChart:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .home, .budgetBar:
            return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        case .transactions(let monthYear), .budget(let monthYear), .pieChart(let monthYear):
            return .requestParameters(parameters: ["month": monthYear.month, "year": monthYear.year], encoding: URLEncoding.httpBody)
        }
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
        case .budgetBar:
            return "BudgetBar".json ?? Data()
        }
    }
}
