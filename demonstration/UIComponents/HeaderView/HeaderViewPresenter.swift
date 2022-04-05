//
//  HeaderViewPresenter.swift
//  demonstration
//
//  Created by Fernando Lucheti on 05/04/22.
//

import Foundation

final class HeaderViewPresenter {
    
    private weak var delegate: HeaderViewDelegate?
    var didSelectMonth: (MonthYear) -> Void
    
    enum Operation { case next; case previous }
    
    private lazy var selectedMonth = Date.currentMonthYear
    var monthName: String {
        months[selectedMonth.month-1]
    }
    
    private let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    init(didSelectMonthBlock: @escaping (MonthYear) -> Void) {
        self.didSelectMonth = didSelectMonthBlock
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
