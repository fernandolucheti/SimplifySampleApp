//
//  TransactionsPresenterTests.swift
//  demonstrationTests
//
//  Created by Fernando on 02/01/22.
//

import XCTest
@testable import demonstration

class TransactionsPresenterTests: XCTestCase {
    
    lazy var service = TransactionsServiceMock()
    lazy var sut = TransactionsPresenter(service: service)
    lazy var transactionsPresenterSpy = TransactionsPresenterSpy()
    
    func testFetch() throws {
        sut.setDelegate(transactionsPresenterSpy)
        sut.fetch()
        XCTAssertTrue(transactionsPresenterSpy.viewModel?.transactions.first?.value == 50.0)
        XCTAssertTrue(transactionsPresenterSpy.viewModel?.transactions.first?.name == "Restaurant")
        XCTAssertTrue(transactionsPresenterSpy.viewModel?.transactions.first?.date == "01/01/2022")
        XCTAssertTrue(transactionsPresenterSpy.viewModel?.transactions.first?.categoryColor == "#ffffff")
    }
    
    func testError() {
        sut = TransactionsPresenter(service: TransactionsServiceErrorMock())
        sut.setDelegate(transactionsPresenterSpy)
        sut.fetch()
        XCTAssertTrue(transactionsPresenterSpy.error == NetworkErrors.generic)
    }
}

final class TransactionsServiceMock: TransactionsServiceLogic {
    func fetch(completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void) {
        let response = TransactionModels.Response(transactions: [
            TransactionModels.Transaction(value: 50.0,
                                          name: "Restaurant",
                                          date: "01/01/2022",
                                          categoryColor: "#ffffff"),
            
            TransactionModels.Transaction(value: 40.0,
                                          name: "Movie",
                                          date: "02/01/2022",
                                          categoryColor: "#c1c1c1"),
        ])
        completion(.success(response))
    }
}

final class TransactionsServiceErrorMock: TransactionsServiceLogic {
    
    func fetch(completion: @escaping (Result<TransactionModels.Response, NetworkErrors>) -> Void) {
        completion(.failure(NetworkErrors.generic))
    }
}

final class TransactionsPresenterSpy: TransactionsPresenterDelegate {
    
    var presentSuccessCalled = false
    var presentErrorCalled = false
    var viewModel: TransactionModels.ViewModel?
    var error: NetworkErrors?
    
    func presentSuccess(viewModel: TransactionModels.ViewModel) {
        presentSuccessCalled = true
        self.viewModel = viewModel
    }
    
    func presentError(_ error: NetworkErrors) {
        presentErrorCalled = false
        self.error = error
    }
}
