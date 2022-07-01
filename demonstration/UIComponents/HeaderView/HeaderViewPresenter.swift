//
//  HeaderViewPresenter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 05/04/22.
//

import Foundation

final class HeaderViewPresenter {
    
    private weak var delegate: HeaderViewDelegate?
    private var didSelectMonth: (MonthYear) -> Void
    
    enum Operation { case next; case previous }
    
    private var selectedMonth: MonthYear
    
    var monthName: String {
        monthNames[selectedMonth.month-1]
    }
    
    private let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    init(selectedMonth: MonthYear = Date.currentMonthYear, didSelectMonth: @escaping (MonthYear) -> Void) {
        self.didSelectMonth = didSelectMonth
        self.selectedMonth = selectedMonth
    }
    
    func setDelegate(_ delegate: HeaderViewDelegate) {
        self.delegate = delegate
    }
    
    func updateMonth(_ operation: Operation) {
        selectedMonth = operation == .next ? selectedMonth.nextMonth() : selectedMonth.previousMonth()
        delegate?.setIcon(selectedMonth.month == Date.currentMonth ? SystemIcons.calendar : SystemIcons.calendarOvertime)
        var monthName = monthName
        if Date.currentYear != selectedMonth.year {
            monthName.append(contentsOf: " \(selectedMonth.year % 100)")
        }
        delegate?.setMonthName(monthName)
        didSelectMonth(selectedMonth)
    }
}
