//
//  HomeBudgetBarModelsTests.swift
//  demonstrationTests
//
//  Created by Fernando Lucheti on 27/10/22.
//

import XCTest
@testable import demonstration

class HomeBudgetBarModelsTests: XCTestCase {
    
    private typealias ViewModel = HomeBudgetBarModels.ViewModel
    private typealias Category = HomeBudgetBarModels.CategoryViewModel
    
    func testCategoriesSum() {
        let categories = [Category(color: "#FFFFFF", totalSpent: 10),
                          Category(color: "#FFFFFF", totalSpent: 10),
                          Category(color: "#FFFFFF", totalSpent: 10)]
        let viewModel = ViewModel(categories: categories)
        XCTAssertTrue(viewModel.totalSpentSum == 30)
    }
    
    func testCategoriesZeroSum() {
        var categories: [Category] = []
        var viewModel = ViewModel(categories: categories)
        XCTAssertTrue(viewModel.totalSpentSum == 0)
        
        categories = [Category(color: "#FFFFFF", totalSpent: 0),
                      Category(color: "#FFFFFF", totalSpent: 0),
                      Category(color: "#FFFFFF", totalSpent: 0)]
        viewModel = ViewModel(categories: categories)
        XCTAssertTrue(viewModel.totalSpentSum == 0)
    }
}
