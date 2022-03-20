//
//  TransactionsModels.swift
//  demonstration
//
//  Created by Fernando on 02/01/22.
//

import Foundation

struct TransactionModels {
    
    struct Transaction: Decodable {
        let value: Double
        let name: String
        let date: String
        let categoryColor: String
        
        private enum CodingKeys : String, CodingKey {
            case value, name, date, categoryColor = "category_color"
        }
    }
    
    struct Response: Decodable {
        let transactions: [Transaction]
    }
    
    struct ViewModel {
        let transactions: [TransactionCellViewModel]
    }
}
