//
//  VerticalTabBarWorkerTests.swift
//  demonstration
//
//  Created by Fernando Lucheti on 20/03/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

@testable import demonstration
import XCTest
import Moya

class VerticalTabBarServiceTests: XCTestCase {
    
    lazy var provider = NetworkProvider<NetworkRequests>(stubClosure: MoyaProvider.immediatelyStub)
    lazy var sut = HomeBudgetBarService(provider: provider)
    
    func testFetch() {
        
        sut.fetch { result in
            XCTAssertTrue(result.categories.first?.color == "#A00014")
            XCTAssertTrue(result.categories.first?.totalSpent == 541.5)
        }
    }
}
