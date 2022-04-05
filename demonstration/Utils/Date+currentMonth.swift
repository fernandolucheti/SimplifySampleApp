//
//  Date+currentMonth.swift
//  demonstration
//
//  Created by Fernando Lucheti on 21/03/22.
//

import Foundation

extension Date {
    static var currentMonth: Int {
        Calendar.current.component(.month, from: Date())
    }
    
    static var currentMonthYear: MonthYear {
        MonthYear(month: currentMonth, year: currentYear)
    }
    
    static var currentYear: Int {
        Calendar.current.component(.year, from: Date())
    }
    
    func adding(_ component: Calendar.Component, value: Int, using calendar: Calendar = .current) -> Date? {
        calendar.date(byAdding: component, value: value, to: self)
    }
}
