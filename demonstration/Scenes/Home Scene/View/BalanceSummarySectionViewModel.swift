//
//  BalanceSummarySectionViewModel.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation

struct BalanceSummarySectionViewModel {
    
    enum SectionType {
        case month
        case income
        case expense
        case monthlyBalance
    }
    
    let type: SectionType
    let value: String
    var month: String? = nil
    var first: Bool = false
    var last: Bool = false
    
    var title: String {
        switch type {
        case .month:
            return month ?? ""
        case .income:
            return "income"
        case .expense:
            return "expenses"
        case .monthlyBalance:
            return value.contains("-") ? "month defict" : "month savings"
        }
    }
}
