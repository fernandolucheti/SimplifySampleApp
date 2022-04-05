//
//  MonthYear.swift
//  demonstration
//
//  Created by Fernando Lucheti on 05/04/22.
//

import Foundation

struct MonthYear: Codable {
    let month: Int
    let year: Int
    
    func nextMonth() -> MonthYear {
        let year = month+1 > 12 ? year + 1 : year
        var month = (month+1) % 13
        if month == 0 { month = 1 }
        return MonthYear(month: month, year: year)
    }
    
    func previousMonth() -> MonthYear {
        let year = month-1 < 1 ? year - 1 : year
        let month = month-1 < 1 ? 12 : month-1
        return MonthYear(month: month, year: year)
    }
}
