//
//  MonthYearTests.swift
//  demonstrationTests
//
//  Created by Fernando Lucheti on 05/04/22.
//

@testable import demonstration
import XCTest

class MonthYearTests: XCTestCase {
    
    func testNextMonths() {
        var month = MonthYear(month: 1, year: 2022)
        var nextMonth = month.nextMonth
        XCTAssertTrue(nextMonth.month == 2)
        XCTAssertTrue(nextMonth.year == 2022)
        
        month = MonthYear(month: 12, year: 2022)
        nextMonth = month.nextMonth
        XCTAssertTrue(nextMonth.month == 1)
        XCTAssertTrue(nextMonth.year == 2023)
    }
    
    func testPreviousMonths() {
        var month = MonthYear(month: 1, year: 2022)
        var previousMonth = month.previousMonth
        XCTAssertTrue(previousMonth.month == 12)
        XCTAssertTrue(previousMonth.year == 2021)
        
        month = MonthYear(month: 12, year: 2022)
        previousMonth = month.previousMonth
        XCTAssertTrue(previousMonth.month == 11)
        XCTAssertTrue(previousMonth.year == 2022)
    }
}
