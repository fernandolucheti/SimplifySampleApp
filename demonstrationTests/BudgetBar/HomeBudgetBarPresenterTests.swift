//
//  HomeBudgetBarPresenterTests.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import demonstration
import XCTest
import Moya

class HomeBudgetBarPresenterTests: XCTestCase {
    
    lazy var service = HomeBudgetBarServiceMock()
    lazy var sut = HomeBudgetBarPresenter(service: service)
    lazy var presenterSpy = HomeBudgetBarPresenterSpy()
    
    func testFetch() throws {
        sut.setDelegate(presenterSpy)
        sut.fetch()
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.color == "#A00014")
        XCTAssertTrue(presenterSpy.viewModel?.categories.first?.totalSpent == 541.5)
    }
}

final class HomeBudgetBarServiceMock: HomeBudgetBarServiceLogic {
    func fetch(completion: @escaping (VerticalTabBarModels.Response) -> Void) {
        let response = VerticalTabBarModels.Response(categories: [
            VerticalTabBarModels.Category(color: "#A00014", totalSpent: 541.5)
        ])
        completion(response)
    }
}

final class HomeBudgetBarPresenterSpy: HomeBudgetBarPresenterDelegate {
    
    var presentSuccessCalled = false
    var presentErrorCalled = false
    var viewModel: VerticalTabBarModels.ViewModel?
    
    func presentSuccess(viewModel: VerticalTabBarModels.ViewModel) {
        presentSuccessCalled = true
        self.viewModel = viewModel
    }
}
