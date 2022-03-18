//
//  demonstrationTests.swift
//  demonstrationTests
//
//  Created by Fernando on 01/01/22.
//

import XCTest
@testable import demonstration

class HomePresenterTests: XCTestCase {
    
    lazy var service = HomeServiceMock()
    lazy var sut = HomePresenter(service: service)
    lazy var homePresenterSpy = HomePresenterSpy()
    
    func testFetch() throws {
        sut.setDelegate(homePresenterSpy)
        sut.fetch()
        
        XCTAssertTrue(homePresenterSpy.viewModel?.balance == 100.00)
        
        let sections = homePresenterSpy.viewModel?.sections
        let monthSection = sections?.filter({ section in
            (section as? MonthSummarySectionViewModel) != nil
        }).first as! MonthSummarySectionViewModel
        XCTAssertTrue(monthSection.month == "November")
        
        let incomeSection = sections?.filter({ section in
            (section as? BalanceSummarySectionViewModel)?.type == .income
        }).first as! BalanceSummarySectionViewModel
        XCTAssertTrue(incomeSection.value == 200.0)
        
        let expensesSection = sections?.filter({ section in
            (section as? BalanceSummarySectionViewModel)?.type == .expense
        }).first as! BalanceSummarySectionViewModel
        XCTAssertTrue(expensesSection.value == 100.0)
        
        let monthlyBalanceSection = sections?.filter({ section in
            (section as? BalanceSummarySectionViewModel)?.type == .monthlyBalance
        }).first as! BalanceSummarySectionViewModel
        XCTAssertTrue(monthlyBalanceSection.value == 100.0)
    }
    
    func testError() {
        sut = HomePresenter(service: HomeServiceErrorMock())
        sut.setDelegate(homePresenterSpy)
        sut.fetch()
        XCTAssertTrue(homePresenterSpy.error == NetworkErrors.generic)
    }
}

final class HomeServiceMock: HomeServiceLogic {
    func fetch(completion: @escaping (Result<HomeModels.Response, NetworkErrors>) -> Void) {
        let response = HomeModels.Response(month: "November",
                                           balance: 100.0,
                                           income: 200.0,
                                           expenses: 100.0,
                                           monthlyBalance: 100.0)
        completion(.success(response))
    }
}

final class HomeServiceErrorMock: HomeServiceLogic {
    
    func fetch(completion: @escaping (Result<HomeModels.Response, NetworkErrors>) -> Void) {
        completion(.failure(NetworkErrors.generic))
    }
}

final class HomePresenterSpy: HomePresenterDelegate {
    
    var presentSuccessCalled = false
    var presentErrorCalled = false
    var viewModel: HomeModels.ViewModel?
    var error: NetworkErrors?
    
    func presentSuccess(viewModel: HomeModels.ViewModel) {
        presentSuccessCalled = true
        self.viewModel = viewModel
    }
    
    func presentError(_ error: NetworkErrors) {
        presentErrorCalled = false
        self.error = error
    }
}
