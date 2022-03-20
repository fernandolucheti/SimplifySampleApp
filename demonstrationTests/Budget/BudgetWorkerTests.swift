//
//  BudgetWorkerTests.swift
//  demonstration
//
//  Created by Fernando Lucheti on 18/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import demonstration
import XCTest
import Moya

class BudgetServiceTests: XCTestCase {
    
    lazy var provider = MoyaProvider<NetworkRequests>(stubClosure: MoyaProvider.immediatelyStub)
    lazy var sut = BudgetService(provider: provider)
    
    func testFetch() {
        
        sut.fetch { result in
            switch result {
            case .success(let response):
                XCTAssertTrue(response.categories.first?.name == "Restaurants")
                XCTAssertTrue(response.categories.first?.color == "#A00014")
                XCTAssertTrue(response.categories.first?.budget == 500.0)
                XCTAssertTrue(response.categories.first?.totalSpent == 541.5)
                XCTAssertTrue(response.categories.first?.budgetRemaining == -41.5)
            case .failure:
                XCTFail()
            }
        }
    }
}
