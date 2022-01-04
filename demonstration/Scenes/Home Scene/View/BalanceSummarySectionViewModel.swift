//
//  BalanceSummarySectionViewModel.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import UIKit

protocol SummarySectionViewModel {
    var first: Bool { get }
    var last: Bool { get }
    var title: String { get }
    var sectionColor: UIColor { get }
    var borderColor: UIColor { get }
}

struct MonthSummarySectionViewModel: SummarySectionViewModel {
    var month: String
    var first: Bool = false
    var last: Bool = false
    var title: String {
        month
    }
    var sectionColor: UIColor = .primaryColor
    var borderColor: UIColor = .secondaryColor
}

struct BalanceSummarySectionViewModel: SummarySectionViewModel {
    
    enum SectionType {
        case income
        case expense
        case monthlyBalance
    }
    
    var type: SectionType
    var value: Double
    var first: Bool = false
    var last: Bool = false
    var borderColor: UIColor = .primaryColor
    
    var title: String {
        switch type {
        case .income:
            return "Income"
        case .expense:
            return "Expenses"
        case .monthlyBalance:
            return value < 0 ? "Month defict" : "Month savings"
        }
    }
    
    var sectionColor: UIColor {
        switch type {
        case .income:
            return .primaryAccent
        case .expense:
            return .secondaryAccent
        case .monthlyBalance:
            return value < 0 ? .secondaryAccent : .primaryAccent
        }
    }
}
