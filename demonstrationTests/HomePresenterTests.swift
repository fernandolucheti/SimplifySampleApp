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
        XCTAssertTrue(homePresenterSpy.viewModel?.month == "November")
        XCTAssertTrue(homePresenterSpy.viewModel?.balance == "$100.00")
        XCTAssertTrue(homePresenterSpy.viewModel?.income == "$200.00")
        XCTAssertTrue(homePresenterSpy.viewModel?.expenses == "$100.00")
        XCTAssertTrue(homePresenterSpy.viewModel?.monthlyBalance == "$100.00")
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
