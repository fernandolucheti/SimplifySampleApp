//
//  HomeModels.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation

struct HomeModels {
    struct Response: Decodable {
        let month: String
        let balance: Double
        let income: Double
        let expenses: Double
        let monthlyBalance: Double
        
        private enum CodingKeys : String, CodingKey {
            case month, balance, income, expenses, monthlyBalance = "monthly_balance"
        }
    }
    
    struct ViewModel {
        let balance: Double
        let sections: [SummarySectionViewModel]
    }
}
