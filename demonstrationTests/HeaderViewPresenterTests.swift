//
//  HeaderViewPresenterTests.swift
//  demonstrationTests
//
//  Created by Fernando Lucheti on 05/04/22.
//

@testable import demonstration
import XCTest

class HeaderViewPresenterTests: XCTestCase {
    
    func testNextMonth() {
        var sut = HeaderViewPresenter(selectedMonth: MonthYear(month: 1, year: 2022)) { _ in }
        let delegateSpy = HeaderViewPresenterDelegateSpy()
        sut.setDelegate(delegateSpy)
        sut.updateMonth(.next)
        XCTAssertTrue(delegateSpy.monthName == "February")

        sut = HeaderViewPresenter(selectedMonth: MonthYear(month: 12, year: 2022)) { _ in }
        sut.setDelegate(delegateSpy)
        sut.updateMonth(.next)
        XCTAssertTrue(delegateSpy.monthName == "January 23")
    }
    
    func testPreviousMonth() {
        var sut = HeaderViewPresenter(selectedMonth: MonthYear(month: 1, year: 2022)) { _ in }
        let delegateSpy = HeaderViewPresenterDelegateSpy()
        sut.setDelegate(delegateSpy)
        sut.updateMonth(.previous)
        XCTAssertTrue(delegateSpy.monthName == "December 21")

        sut = HeaderViewPresenter(selectedMonth: MonthYear(month: 12, year: 2022)) { _ in }
        sut.setDelegate(delegateSpy)
        sut.updateMonth(.previous)
        XCTAssertTrue(delegateSpy.monthName == "November")
    }
}

class HeaderViewPresenterDelegateSpy: HeaderViewDelegate {
    
    var icon: SystemIcons?
    var monthName: String?
    
    func setIcon(_ icon: SystemIcons) {
        self.icon = icon
    }
    
    func setMonthName(_ monthName: String) {
        self.monthName = monthName
    }
    
    
}
