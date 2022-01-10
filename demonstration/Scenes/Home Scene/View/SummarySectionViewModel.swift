//
//  SummarySectionViewModel.swift
//  demonstration
//
//  Created by Fernando on 01/01/22.
//

import Foundation

protocol SummarySectionViewModel {
    var first: Bool { get }
    var last: Bool { get }
    var title: String { get }
    var sectionColor: ColorTheme { get }
    var borderColor: ColorTheme { get }
}

struct MonthSummarySectionViewModel: SummarySectionViewModel {
    var month: String
    var first: Bool = false
    var last: Bool = false
    var title: String {
        month
    }
    var sectionColor: ColorTheme = ColorTheme.primaryColor
    var borderColor: ColorTheme = ColorTheme.secondaryColor
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
    var borderColor: ColorTheme = ColorTheme.primaryColor
    
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
    
    var sectionColor: ColorTheme {
        switch type {
        case .income:
            return ColorTheme.primaryAccent
        case .expense:
            return ColorTheme.secondaryAccent
        case .monthlyBalance:
            return value < 0 ? ColorTheme.secondaryAccent : ColorTheme.primaryAccent
        }
    }
}
