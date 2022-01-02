//
//  HomeModels.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation

struct HomeModels {
    struct Response: Decodable {
        let balance: Double
        let income: Double
        let expenses: Double
        let monthlyBalance: Double
        
        private enum CodingKeys : String, CodingKey {
            case balance, income, expenses, monthlyBalance = "monthly_balance"
        }
    }
    
    struct ViewModel {
        let balance: String
        let income: String
        let expenses: String
        let monthlyBalance: String
    }
}
