//
//  PieChartPresenterTests.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import demonstration
import XCTest
import Moya

class PieChartPresenterTests: XCTestCase {
    
    lazy var service = PieChartServiceMock()
    lazy var sut = PieChartPresenter(service: service)
    lazy var presenterSpy = PieChartPresenterSpy()
    
    func testFetch() throws {
        sut.setDelegate(presenterSpy)
        sut.fetch(monthYear: MonthYear(month: 4, year: 2022))
        
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.name == "Restaurants")
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.color == UIColor(hex: "#A00014"))
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.totalSpent == 541.5)
    }
    
    func testError() {
        sut = PieChartPresenter(service: PieChartServiceErrorMock())
        sut.setDelegate(presenterSpy)
        sut.fetch(monthYear: MonthYear(month: 4, year: 2022))
        XCTAssertTrue(presenterSpy.error == NetworkErrors.generic)
    }
}

final class PieChartServiceMock: PieChartServiceLogic {
    func fetch(monthYear: MonthYear, completion: @escaping (Result<PieChartModels.Response, NetworkErrors>) -> Void) {
        let response = PieChartModels.Response(categories: [
            PieChartModels.Category(name: "Restaurants", color: "#A00014", totalSpent: 541.5)
        ])
        completion(.success(response))
    }
}

final class PieChartServiceErrorMock: PieChartServiceLogic {
    
    func fetch(monthYear: MonthYear, completion: @escaping (Result<PieChartModels.Response, NetworkErrors>) -> Void) {
        completion(.failure(NetworkErrors.generic))
    }
}

final class PieChartPresenterSpy: PieChartPresenterDelegate {
    
    var presentSuccessCalled = false
    var presentErrorCalled = false
    var viewModel: PieChartModels.ViewModel?
    var error: NetworkErrors?
    
    func presentSuccess(viewModel: PieChartModels.ViewModel) {
        presentSuccessCalled = true
        self.viewModel = viewModel
    }
    
    func presentError(_ error: NetworkErrors) {
        presentErrorCalled = false
        self.error = error
    }
}
