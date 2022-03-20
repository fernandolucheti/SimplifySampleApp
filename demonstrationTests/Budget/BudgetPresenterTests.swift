//
//  BudgetPresenterTests.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import demonstration
import XCTest

class BudgetPresenterTests: XCTestCase {
    
    lazy var service = BudgetServiceMock()
    lazy var sut = BudgetPresenter(service: service)
    lazy var presenterSpy = BudgetPresenterSpy()
    
    func testFetch() throws {
        sut.setDelegate(presenterSpy)
        sut.fetch()
        
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.categoryName == "Restaurants")
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.color == UIColor(hex: "#A00014"))
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.categoryBudget == 500.0.currencyString())
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.totalSpent == 541.5.currencyString())
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.categoryBudgetRemaining == (-41.5).currencyString())
    }
    
    func testError() {
        sut = BudgetPresenter(service: BudgetServiceErrorMock())
        sut.setDelegate(presenterSpy)
        sut.fetch()
        XCTAssertTrue(presenterSpy.error == NetworkErrors.generic)
    }
}

final class BudgetServiceMock: BudgetServiceLogic {
    
    let mock = BudgetModels.Response(categories: [
        BudgetModels.Category(name: "Restaurants", color: "#A00014", budget: 500.0, totalSpent: 541.5, budgetRemaining: -41.5)
    ])
    
    func fetch(completion: @escaping (Result<BudgetModels.Response, NetworkErrors>) -> Void) {
        completion(.success(mock))
    }
}

final class BudgetServiceErrorMock: BudgetServiceLogic {
    
    func fetch(completion: @escaping (Result<BudgetModels.Response, NetworkErrors>) -> Void) {
        completion(.failure(NetworkErrors.generic))
    }
}

final class BudgetPresenterSpy: BudgetPresenterDelegate {
    
    var presentSuccessCalled = false
    var presentErrorCalled = false
    var viewModel: BudgetModels.ViewModel?
    var error: NetworkErrors?
    
    func presentSuccess(viewModel: BudgetModels.ViewModel) {
        presentSuccessCalled = true
        self.viewModel = viewModel
    }
    
    func presentError(_ error: NetworkErrors) {
        presentErrorCalled = false
        self.error = error
    }
}
