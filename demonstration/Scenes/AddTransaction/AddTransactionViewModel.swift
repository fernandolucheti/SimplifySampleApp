//
//  AddTransactionViewModel.swift
//  demonstration
//
//  Created by Fernando Lucheti on 04/11/22.
//

import SwiftUI

final class AddTransactionViewModel: ObservableObject {
    
    @Published var transactionType: AddTransactionModels.TransactionType = .expense
    @Published var value: String = ""
    @Published var category: AddTransactionModels.Category
    @Published var account: AddTransactionModels.Account
    @Published var toggleKeyboard = true
    
    private var decimalValue: Double { (Double(value) ?? 0)/100 }
    
    init(category: AddTransactionModels.Category, account: AddTransactionModels.Account) {
        self.category = category
        self.account = account
    }
    
    var displayValue: String {
        decimalValue.currencyString()
    }
    
    var displayText: String {
        switch transactionType {
        case .income:
            return "Income"
        case .expense:
            return category.name
        case .transfer:
            return "Transfer"
        }
    }
    
    var displayColor: Color {
        switch transactionType {
        case .income:
            return Color(uiColor: ColorTheme.primaryAccent.color)
        case .expense:
            return Color(uiColor: .init(hex: category.color))
        case .transfer:
            return .gray
        }
    }
    
    var accountColor: Color {
        Color(uiColor: UIColor(hex: account.color))
    }
}
