//
//  AddTransactionModels.swift
//  demonstration
//
//  Created by Fernando Lucheti on 02/11/22.
//

import Foundation

struct AddTransactionModels {
    
    struct Category {
        var name: String
        var color: String
    }
    
    struct Account {
        var name: String
        var color: String
    }
    
    enum TransactionType: String, CaseIterable {
        case income
        case expense
        case transfer
    }
}
